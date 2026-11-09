if (instance_exists(oPlayer)){
        // adicionando upgrade na lista de modificadores do status
    array_push(oPlayer.stateUpgrade.upgradesList[idUpgrade], 
        new Upgrade(idUpgrade, nameUpgrade, lvlMaxUpgrade, multiUpgrade)
    );
}