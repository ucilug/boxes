# Boxes
Our server configurations.

## Requirements
- Debian Stretch or newer on nodes
- Ansible 2.2 or newer on local machine
- CloudFlare or any other DNS provider supported by [Lexicon](https://github.com/AnalogJ/lexicon)

## Usage
1. Run `make scaffold` to generate the `shared` and `private` directories
    - The `shared` directory is meant to be shared with your group, and the `private` directory is, well, private.
2. Edit configurations in `shared`
    - You will need to edit the domain names in `playbooks/main.yml` as well if you aren't deploying to LUG@UCI servers
3. Authorize `private/ansible.key.pub` on your nodes
4. Run `make deploy` and hope things don't break
5. Share the `shared` directory after verifying that everything works

It's important that everyone's `shared` directory is up-to-date. An alternative to sharing configurations is to deploy with a central interface (e.g. [Semaphore](https://github.com/ansible-semaphore/semaphore)).

To force a rebuild of the MediaWiki database, delete the database and `LocalSettings.php`, then run Ansible again.
