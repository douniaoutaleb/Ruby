load "mini_project1.rb"

class Test
	a = Bibliotheque.new
	a5 = Adherent.new("Outaleb","Dounia")
	a2 = Adherent.new("Outale","Douni")
	a.addAdherent(a5)
	a.addAdherent(a2)
	a3 = Livre.new("Livre1","Auteur1")
	a2 = Livre.new("Livre2","Auteur2")
	a.addDocument(a3)
	a.addDocument(a2)
	a1 = Revue.new("Revue1",1)
	a2 = Revue.new("Revue2",2)
	a.addDocument(a1)
	a.addDocument(a2)
	a1 = Dictionnaire.new("Dicos1","Auteur1","archeology1")
	a2 = Dictionnaire.new("Dicos2","Auteur2","archeology2")
	a.addDocument(a1)
	a.addDocument(a2)
	a1 = BandeDessinee.new("Dicos1","Auteur1","dessinateur1")
	a2 = BandeDessinee.new("Dicos2","Auteur2","dessinateur2")
	a.addDocument(a1)
	a.addDocument(a2)
	a1 = OrdinateurPortable.new(false,"HP")
	a2 = OrdinateurPortable.new(false,"Acer")
	a.addMatériel(a1)
	a.addMatériel(a2)
	
	a5.emprunter(a3)
	a5.emprunter(a3)
	a.afficherFonds
	a5.afficherEmprunts
	a5.rendre(a3)
	a5.afficherEmprunts
	a.afficherFonds
end