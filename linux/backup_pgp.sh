#!/bin/bash
#
#
# Linux script to backup you're pgp keys (gnupg)
#
## To run this script
# In you're terminal go to the directory where you want to have you're backup located.
# Then run the next line without qoutes
# "wget https://gist.githubusercontent.com/dpater1986/86889c250ff6558fd4518771b0801fce/raw/64eb86213cfd76ff787ab05c029845ff5a271e3f/backup_pgp.sh && chmod +x backup_pgp.sh && ./backup_pgp.sh"

clear

keyid=$(gpg --list-secret-key --keyid-format short | grep sec | cut --complement -d '/' -f 1 | cut -d ' ' -f -1 | head -n 1)
gpg --list-key $keyid
echo ""
read -p "Is $keyid the key you want to backup? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    
elif [[ $REPLY =~ ^[Nn]$ ]]
then
    gpg --list-secret-key --keyid-format short
    read -p "Pleasy type in the keyid after the '/' like $keyid" -r $keyid
else
    echo "The script has stop you didn´t anwser correctly."
    echo "Keep in mind there is ´NO BACKUP!!!´"
    exit
fi

# Create the backup
# The line with "--export-option backup" you can use best for gnupg import. 
gpg -o private_keys_$keyid --export-option backup --export-secret-keys $keyid
#gpg -o private_key_$keyid --export-secret-key $keyid

# This backup I personaly share with my other maschines.
gpg -o private_subkeys_$keyid --export-secret-subkeys $keyid
gpg -ao keyring.asc --export
# Next file i use for share my public keys with others
gpg -ao public_key_$keyid --export $keyid
gpg --export-ownertrust >ownertrust.asc
umask 077; tar -cf gnupg_directory_backup.tar -C $HOME .gnupg

echo "It is done :D"
echo #!/bin/bash
#
#
# Linux script to backup you're pgp keys (gnupg)
#
## To run this script
# In you're terminal go to the directory where you want to have you're backup located.
# Then run the next line without qoutes
# "wget https://gist.githubusercontent.com/dpater1986/86889c250ff6558fd4518771b0801fce/raw/64eb86213cfd76ff787ab05c029845ff5a271e3f/backup_pgp.sh && chmod +x backup_pgp.sh && ./backup_pgp.sh"

clear

keyid=$(gpg --list-secret-key --keyid-format short | grep sec | cut --complement -d '/' -f 1 | cut -d ' ' -f -1 | head -n 1)
gpg --list-key $keyid
echo ""
read -p "Is $keyid the key you want to backup? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    
elif [[ $REPLY =~ ^[Nn]$ ]]
then
    gpg --list-secret-key --keyid-format short
    read -p "Pleasy type in the keyid after the '/' like $keyid" -r $keyid
else
    echo "The script has stop you didn´t anwser correctly."
    echo "Keep in mind there is ´NO BACKUP!!!´"
    exit
fi

# Create the backup
# The line with "--export-option backup" you can use best for gnupg import. 
gpg -o private_keys_$keyid --export-option backup --export-secret-keys $keyid
#gpg -o private_key_$keyid --export-secret-key $keyid

# This backup I personaly share with my other maschines.
gpg -o private_subkeys_$keyid --export-secret-subkeys $keyid
gpg -ao keyring.asc --export
# Next file i use for share my public keys with others
gpg -ao public_key_$keyid --export $keyid
gpg --export-ownertrust >ownertrust.asc
umask 077; tar -cf gnupg_directory_backup.tar -C $HOME .gnupg

echo 
