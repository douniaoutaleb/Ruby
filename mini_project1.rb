Statut = ["Etudiant","Enseignant"]
Os = ["Linux","Windows"]

class Bibliotheque
	attr_reader :t_adherent, :t_document, :t_materiel
	def initialize()
		@t_adherent = Array.new([]) 
		@t_document = Array.new([]) 
		@t_materiel = Array.new([]) 
	end

	def addAdherent(adherent)
		a = @t_adherent.length
		@t_adherent<<adherent
		if(@t_adherent.length== a+1)
			return true
		else
			return false
		end
	end

	def addDocument(document)
		a = @t_document.length
		@t_document<< document 
		if(@t_document.length == a+1)
			return true
		else
			return false
		end
	end

	def addMatériel(materiel)
		a = @t_materiel.length
		@t_materiel<<materiel
		if(@t_materiel.length== a+1)
			return true
		else
			return false
		end
	end

	def afficherFonds
		i = 0
		puts "Les documents:"
		@t_document.each{ |v|
			if v.isDisponible
				dis = "Disponnible"
			else
				dis = "Non Disponnible"
			end
			puts "document n°#{i}: #{dis} : "+v.affiche
			i+=1
			if dis=="Non Disponnible" && v.is_a?(Livre)
				puts "Emprunte par:#{v.t_e[0]}"
			end
		}
		i = 0
		puts "Les materiels:"
		@t_materiel.each{ |v|
			if v.isDisponible
				dis = "Disponnible"
			else
				dis = "Non Disponnible"
			end
			puts "materiel n°#{i}: #{dis} : "+v.affiche
			i+=1
			if dis=="Non Disponnible" && v.is_a?(OrdinateurPortable)
				puts "Emprunte par:#{v.t_o[0]}"
			end
		}		
	end

	def rechercherTitre
		
	end
end

class Adherent
	attr_reader :nom, :prenom, :statut, :id
	attr_accessor :nbr_livre, :nbr_ordi, :t_emprunt, :id
	attr_writer :nbr_livre, :nbr_ordi, :id

	@@id=0
	
	

	def initialize(nom,prenom)
		@nbr_livre = 0
		@nbr_ordi = 0
		@t_emprunt = Array.new()
		if nom.is_a?(String)
			@nom = nom
			if prenom.is_a?(String)
				@prenom = prenom
			else
				puts "wrong type please retry"
			end
		else
			puts "wrong type please retry"
		end
		puts "Choisissez le statut de l'adherent: Etudiant (0) | Enseignant (1)"
		statut = gets
		@statut = Statut[Integer(statut)]
		@@id+=1
	end


	def emprunter(object)
		if object.is_a?(Livre) && @nbr_livre<6
			if object.isDisponible
				object.dispo = false
				@nbr_livre+=1
				object.t_e<<(@nom+" "+@prenom)
				@t_emprunt<<object
				puts "Emprunt du livre reussi!"
			else
				puts "Livre deja emprunte :("
			end
		else if @nbr_livre == 6
				puts "Max d'emprunts de livre atteints."
			end
		end

		if object.is_a?(OrdinateurPortable) && @nbr_ordi<2
			if object.isDisponible
				object.dispo = false
				@nbr_ordi+=1
				object.t_o<<(@nom+" "+@prenom)
				@t_emprunt<<object
				puts "Emprunt de l'ordinateur reussi!"
			else
				puts "Ordinateur deja emprunte :("
			end
		else if @nbr_ordi == 2
				puts "Max d'emprunts d'ordinateur atteints."
			end
		end 

		if !object.is_a?(Livre) && !object.is_a?(OrdinateurPortable)
			puts "Objet non empruntable."
		end
	end

	def rendre(object)
		if object.is_a?(Livre) && !object.isDisponible
			object.dispo = true
			@nbr_livre-=1
			object.t_e.delete(@nom+" "+@prenom)
			@t_emprunt.delete(object)
			puts "Retour du livre reussi!"
		else if object.is_a?(Livre) && object.isDisponible
				puts "Livre deja retourne :)"
			end
		end

		if object.is_a?(OrdinateurPortable) && !object.isDisponible
			object.dispo = true
			@nbr_ordi-=1
			object.t_o.delete(@nom+" "+@prenom)
			@t_emprunt.delete(object)
			puts "Retour de l'ordinateur reussi!"
		else if object.is_a?(OrdinateurPortable) && object.isDisponible
				puts "Ordinateur deja retourne :)"
			end
		end

		if !object.is_a?(Livre) && !object.is_a?(OrdinateurPortable)
			puts "Objet non empruntable."
		end
			
		#needs to be added to the biblio
	end

	def afficherEmprunts
		i = 1
		puts "historique des emprunts:
		"
		@t_emprunt.each{ |u|
			puts "#{i}) #{u.affiche}"
			i+=1
		}
	end 


	def affiche
		return " nom: #{@nom}, prenom: #{@prenom}, statut: #{@statut}"
	end
end

class Materiel < Bibliotheque
	attr_reader :enPanne
	attr_accessor :id
	@@id=0
	def initialize(enPanne)
		if enPanne.is_a?(TrueClass) | enPanne.is_a?(FalseClass)
			@enPanne = enPanne
		else
			puts "wrong type please retry"
		end
		@@id+=1
	end
end

module Empruntable
	def isDisponible
		if @dispo.is_a?(TrueClass)
			return true
		elsif @dispo.is_a?(FalseClass)			
			return false
		end
	end
end

class Document
	attr_reader :titre
	def initialize(titre)
		if titre.is_a?(String)
			@titre = titre
		else
			puts "wrong type please retry"
		end
	end
end

class Revue < Document
	attr_reader :numero, :dispo
	attr_writer :dispo
	include Empruntable
	def initialize(titre,numero)
		super(titre)
		@dispo = false
		if numero.is_a?(Integer)
			@numero = numero
		else
			puts "wrong type please retry"
		end
	end

	def affiche
		return "Revue: titre: #{@titre}, auteur: #{@auteur}, numero: #{@numero}"
	end
end

class Volume < Document
	attr_reader :auteur
	def initialize(titre,auteur)
		super(titre)
		if auteur.is_a?(String)
			@auteur = auteur
		else
			puts "wrong type please retry"
		end
	end
end

class Dictionnaire < Volume
	attr_reader :theme,:dispo
	attr_writer :dispo
	include Empruntable
	def initialize(titre,auteur,theme)
		super(titre,auteur)
		@dispo = false
		if theme.is_a?(String)
			@theme = theme
		else
			puts "wrong type please retry"
		end
	end

	def affiche
		return "Dictionnaire: titre: #{@titre}, auteur: #{@auteur}, theme: #{@theme}"
	end
end

class BandeDessinee < Volume
	attr_reader :dessinateur, :dispo
	attr_writer :dispo
	include Empruntable
	def initialize(titre,auteur,dessinateur)
		super(titre,auteur)
		@dispo = false
		if dessinateur.is_a?(String)
			@dessinateur = dessinateur
		else
			puts "wrong type please retry"
		end
	end

	def affiche
		return "BD: titre: #{@titre}, auteur: #{@auteur}, dessinateur: #{@dessinateur}"
	end
end

class Livre < Volume
	attr_reader :dispo, :t_e
	attr_writer :dispo, :t_e
	include Empruntable
	def initialize(titre,auteur)
		@t_e = Array.new()
		super(titre,auteur)
		@dispo = true
	end

	def affiche
		return "Livre: titre: #{@titre} , auteur: #{@auteur}"
	end
end



class OrdinateurPortable < Materiel
	attr_reader :marque, :os, :dispo,:t_o
	attr_writer :dispo,:t_o
	include Empruntable
	def initialize(enPanne,marque)
		@t_o = Array.new()
		super(enPanne)
		@dispo = true 
		if marque.is_a?(String)
			@marque = marque
		else
			puts "wrong type please retry"
		end
		puts "Choisissez l'OS de votre ordinateur: Linux (0) | Windows (1)"
		os = gets
		@os = Os[Integer(os)]
	end

	def affiche
		return "PC: enPanne: #{@enPanne} , marque: #{@marque}, OS: #{@os}"
	end

end


