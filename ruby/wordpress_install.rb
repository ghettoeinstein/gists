# I use this script, because instead of learning Chef/Puppet/insert other Automation Tool, I have decided to lean on my existing fountain of ruby 
# knowledge to automate wordpress installs. I use anUbuntu 14.04.2 LTS  distro as my primary server. My ruby version at the time of 
# authoring is ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-linux]. I can not guarantee that the below script will be beneficial or harmful for you.
# USE AT YOUR OWN RISK!


# **Addendum 2016-02-14** THIS SCRIPT IS NOT A COMPLETE IMPLEMENTATION. 



# Depends on this url staying up. I am 99.5% sure that it will not.
LATEST_WP = 'http://wordpress.org/latest.tar.gz'
# Pass in the domain you want to create a folder for as the first additional argument to the script. ex: ruby wordpres_install.rb example.com
WEBSITE_NAME = ARGV[0]
# This is my place where I install all my folders for domains on my server. 
DIRECTORY_BASE = '/var/www/'
# Concatenate that first argument(domain), and the directory base to create a constant that is the fully qualified directory structure
# based on my personal preference/ease of use.
DIRECTORY_NAME = DIRECTORY_BASE + WEBSITE_NAME


def print_directory
  puts DIRECTORY_NAME
end

# In retrospect, this is not really necessary, but I wanted it all to sound more ruby-esque with predicate methods, that build upon each other.
def directory_exist?(directory_name)
  Dir.exist?(directory_name)
end

# Create a directory based on the variable name that you pass in.
def create_directory(directory_name)
  Dir.mkdir(directory_name)
end

# Make a system call to download wordpress from the url stored in the LATEST_WP constant. This assumes that wget is installed on the machine.
def download_wordpress
   `wget #{LATEST_WP}`
end

@dir_name = DIRECTORY_NAME


# If the directory for your domain already exists, then go ahead and alert the user so. If not then create the directory and let the user know
# that the directory is now in existence.
if directory_exist?(@dir_name)
  Dir.chdir(@dir_name)
  puts Dir.pwd + " already exists."
else
  create_directory(@dir_name)
  Dir.chdir(@dir_name)
  puts Dir.pwd + " now exists."
end



#download_wordpress
