projectx
========

# First iteration of ProjectX

## Development
> * All collaborators are added as such on the private github repo projectx. NOTE: Make sure your account is secure! Anyone who has access to your github account or ssh has accces to our project. 
> * You should set up rails and mysql on your local server. In this way the database.yml file should not be committed.
> * There are two main branches. 
>   * central beta: this is what you can merge your branch into when you've finished testing it locally. This is how we'll deploy to droplet1. 
>   * central master: this is a stable version of our site, if anything ever goes down in beta, we can do a "git checkout master" on the production server and we'll be back to a stable version. 
>     * Do not ever develop on the central master branch. When you start working on anything you should create a new branch locally, set the upstream to that branch (will write a bin/ for this) and then push to that upstream. Then when you push to central beta we'll do a "git checkout beta" on droplet1 to test any changes. If all is good after a few hours, we'll merge that with central master 
  
