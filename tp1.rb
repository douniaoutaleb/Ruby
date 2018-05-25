######################=========1=========#######################################
def find(file)
	puts "veuillez saisir votre mot:"
	mot = gets.chomp
	f = 0
	file.each_line{ |ligne|           #lecture ligne à ligne
    	word = ligne.scan(/\w+/)      #lecture de chaque mot d'une ligne
    	for a in word
        	if a==mot
        		f = f+1
        	end
    	end   
	}
	puts "la frequence de #{mot} dans le livre est : #{f}"
end
################################################################################

def occurence(file)
	puts "veuillez saisir votre mot:"
	mot = gets.chomp
	f = 0   
    word = file.scan(/\w+/)              #lecture de chaque mot 
    for a in word
        if a==mot
        	f = f+1
        end
    end   
    puts "la frequence de #{mot} dans le livre est : #{f}"
end
################################################################################
################################################################################

######################=========2=========#######################################
def top10(file)
	puts "***top 10***"
	word = file.scan(/\w+/)              
	count_word = Hash.new(0)
	word.each { |w| count_word[w] += 1 }
    count_word = count_word.sort_by {|k,v| v}.reverse.to_a
    for i in 0..9
    	puts "#{count_word[i][0]}=>#{count_word[i][1]}"
    end
end

################################################################################
################################################################################

######################=========3=========#######################################

def sous_chaine(file)
	puts "veuillez saisir votre sous-chaine:"
	mot = gets.chomp
	word = file.scan(/\w+/)
	f = 0
	count_word = Hash.new(0)
	word.each { |w| 
		if w.include?(mot)
			f += 1 
			count_word[w] += 1
		end
	}
	puts "les mots contenant #{mot}:"
	count_word.sort_by {|k,v| k}.to_a.each{|k,v|
		puts "#{k}=>#{v}"
	}

end
################################################################################

file =File.read("C:/Users/DO/Desktop/Livre.txt")

######============1=================####
puts "============1.1=============="
#find(file)
####
puts "============1.2=============="
occurence(file)

######============2=================####
puts "============2.1=============="
top10(file)

######============3=================####
puts "============3.1=============="
sous_chaine(file)


