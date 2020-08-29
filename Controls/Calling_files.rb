# example to call file that is loaded in the 'Files' folder of Inspec profile using inspec.profile.file
#     /Controls/code.rb   -> in this example is used my file as Calling_files.rb
#    /Files/filecontent.yml  -> in my code I used names.yml
#  maintainted same file structure for convenience, you can refer the names.yml in the files folder

control 'calling_files' do
	title 'call the file from local machine and Inspec profile'
	desc 'example to call file from local directory as well as from the 'Files' folder of Inspec profile using inspec.profile.file'

# Scenario 1 for calling files from local machine	
	if file('F:\Inpsec\names.yml').exist?                     # condition to check whether the file exists
	  all_names = yaml('F:\Inpsec\names.yml').boys            # If condition is true fetch the names from boys Array
	else
	  all_names = yaml('F:\Inpsec\names.yml').girls           # If condition is false fetch the names from girls Array
	end
puts all_names

#================================================================================================================

# Scenario 2 for calling files from Inspec profile
all_names = inspec.profile.file('names.yml')                # syntax to call the file
if all_names.length > 0                                     # condition to check the varible got values from profile
	  all_names = yaml('F:\Inpsec\names.yml').boys            # If condition is true fetch the names from boys Array
	else
	  all_names = yaml('F:\Inpsec\names.yml').girls           # If condition is false fetch the names from girls Array
	end
puts all_names
end
