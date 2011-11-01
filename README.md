# Vagrant installation of a node app server

TODO:

*   varcacheapt & .gitignore
*   check chef.recipe_url
*   install couchdb (cloudant (bigcouch),rpm from couchone (geo),or from source)

## References
*   [haibu](https://github.com/)
*   another [vagrant-haibu project on github](https://github.com/Filirom1/haibu-vagrant.git)
*   [Vagrant](http://vagrantup.com)

## install vagrant


## Managing recipes with knife
We use Chef's `knife`^utility to manage site cookboks, not to manage a chef server.  
So we create a minimal `./.chef/knife.rb` file.

    knife cookbook site install apt

    ** COOKBOOK SITE COMMANDS **
    knife cookbook site show COOKBOOK [VERSION] (options)
    knife cookbook site share COOKBOOK CATEGORY (options)
    knife cookbook site search QUERY (options)
    knife cookbook site download COOKBOOK [VERSION] (options)
    knife cookbook site list (options)
    knife cookbook site unshare COOKBOOK
    knife cookbook site install COOKBOOK [VERSION] (options)
    

## Testing


# Monitoring


    
