class Contact < ActiveRecord::Base
    
end

# Taking data from input form fields and saving it to the database
# Any time you are saving something to a database
# in this case it is contact form submissions, you need to create a model file
# This is the master blueprint of our Contact objects
# Where we put the features of an object - any code related to a contact object
# Things like rules go in here - ex: comments only 250 characters long