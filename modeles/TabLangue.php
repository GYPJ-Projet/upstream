<?php

    /* Classe       : TabLangue
     * Description  : C'est une table qui contient les traductions du produit dans les 
     *                différentes langues supportées.
     * Exemple      : Les tables de langues sont :  typeCarburant, couleur, transmission, etc
     */
    class TabLangue
    {
        private $id;
        private $idLangue;
        private $nom;
        private $disponibilite;
        private $idPays;


        public function  __construct($id = 0, $idLangue = 0, $nom = "", $disponibilite = 1, $idpays="")
        {
            $this->id = $id;
            $this->idLangue = $idLangue;
            $this->nom = $nom;
            $this->disponibilite = $disponibilite;
            $this->idpays = $idpays;
        }

        public function getId()
        {
            return $this->id;
        }

        public function getIdLangue()
        {
            return $this->idLangue;
        }

        public function getNom()
        {
            return $this->nom;
        }

        public function getDisponibilite() {
            return $this->disponibilite;
        }

        public function getIdPays() {
            return $this->idPays;
        }
    }

?>