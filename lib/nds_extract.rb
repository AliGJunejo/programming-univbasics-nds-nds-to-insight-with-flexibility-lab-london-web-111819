# Provided, don't edit
require 'directors_database'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].
  

def flatten_a_o_a(aoa)
  
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)

  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  
  first_director_array = []
  
 row_index = 0 
 while row_index < movies_collection.length do
   first_director_array << movie_with_director_name(name, movies_collection[row_index])
   row_index += 1
 end
 first_director_array
 
end
  
  
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method


def gross_per_studio(collections)
  hash_of_gross_per_studio = {}
  row_index = 0 
  
   while row_index < collections.length do 
    movie = collections[row_index]
    
      if hash_of_gross_per_studio[movie[:studio]]
         hash_of_gross_per_studio[movie[:studio]] += movie[:worldwide_gross]
       else 
         
         hash_of_gross_per_studio[movie[:studio]] = movie[:worldwide_gross]
       end
     
       row_index += 1
  end  
  hash_of_gross_per_studio
end
      
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash


def movies_with_directors_set(source)  
  
  new_array = []
    
  row_index = 0
  while row_index < source.length do 
    column_index = 0 
   # while column_index < source[row_index][:movies].length
    
     
      new_array << movies_with_director_key(source[row_index][:name], source[row_index][:movies])
      
      
      #column_index += 1 
    
    #end
    
  row_index +=1 
  
  end 
 new_array
 end
  
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end