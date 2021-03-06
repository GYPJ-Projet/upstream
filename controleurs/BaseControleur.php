<?php
    abstract class BaseControleur {

        // Fonctions abstraites que les enfants doivent définir sans faute.
        abstract function getNomControleur();
        abstract function traite(array $params);


        // Méthode qui permet aux Contrôleur d'appeler les vue ou simplement
        // envoyer des données pour la demande du AJAX.
        public function afficheVue($nomVue, $donnees = null) {
            $cheminVue = RACINE . "vues/" . $nomVue . ".php";
            if(file_exists($cheminVue))
            {
                //n.b. le paramsètre $donnees sera utilisé DIRECTEMENT dans la vue
                include_once($cheminVue);
            }
            else
            {
                trigger_error("La vue spécifiée est introuvable.");
            }
        }

        // Méthode qui génère le modele demandé 
        public function obtenirDAO($nomModele, $nomTable = null) {
            $classe = "Modele_" . $nomModele;

            if(class_exists($classe)) {
                //on créé la connexion à la BD (les constantes sont dans config.php)
                $connexionPDO = BDUsine::getBD(TYPEBD, NOMBD, HOTE, USAGER, MDP);
                if ($nomTable != null) { 
                    //on crée une instance de la classe Modele_$nomModele avec son paramsètre
                    $objetModele = new $classe($connexionPDO, $nomTable); 
                } else {
                    //on crée une instance de la classe Modele_$nomModele 
                    $objetModele = new $classe($connexionPDO);
                }

                if($objetModele instanceof BaseDAO) {
                    return $objetModele;
                }
                else
                    trigger_error("Modèle invalide!");  
            }
            else
                trigger_error("La classe $classe n'existe pas.");
        }

        // Méthode qui crée un tableau de langue selon la langue demandée
        // Noter que c'est méthode est pour traiter les tables de langues de la BD seulement
        public function creerTabLangue(array $tab, $idLangue) { 
            $tabResultat = array(); 
            foreach($tab as $element) {
                if ($element->getIdLangue() == $idLangue) {
                    $tabResultat[$element->getId()] = $element->getNom(); 
                }
            }
            return $tabResultat;
        }   


        // Méthode pour charger la langue pour ce contrôleur
        public function chargerLangue(&$params) {
            $langue = array(); // Création de la table langue.

            // On va chercher la langue de choisi par l'usager ou 
            // la langue de l'usager selon le cas.
            $langueAffichage = $this->trouveLangueAffichage($params);

            // Chemin d'accès à la langue selon la langue d'affichage choisie
            $cheminLangue = RACINE . "langues/" .  $langueAffichage;
            $fichierLangue = $langueAffichage. ".php";    // Fichier de langue générale (entete, etc)

            // nom du contrôleur qui fait la demande
            $nomControleur =  strtolower($this->getNomControleur());

            // Chemin d'accès du contrôleur selon la langue d'affichage choisie
            $cheminFichierLangueControleur = $cheminLangue . "/" . $nomControleur;

            // Fichier de langue du contrôleur
            $fichierLangueControleur = "langue_" . $nomControleur . ".php";
    
            // Chargrement du fichier de langue commun pour tous 
            // Contient les langues de l'entête, du menu, du pied de page, etc.
            $file = $cheminLangue . "/" . $fichierLangue;
            if (is_file($file)) {
                require($file);
            }

            // Chargrement du fichier de langue propre au contrôleur qui le demande 
            $file = $cheminFichierLangueControleur  . "/" . $fichierLangueControleur;
            if (is_file($file)) {
                require($file);
            }


            return $langue;

        } //  function chargerLangue
        

        // Méthode privée pour déterminer la langue d'affichage 
        // Noter qu'au changement de langue, nous recevons également l'action du controleur
        // qu'il doit excuter pour l'affichage de la page d'où vient, la demande de 
        // changement de langue.
        private function trouveLangueAffichage(&$params) {
            
            $existeSessionLangue = false; // Est-ce que la variable de session "langue" existe ?
            $langueAffichage = "fr-fr";   // par défaut
           
            // Si on a reçu une action ET que cette action est un changement de langue
            if( isset($params["action"]) && $params["action"] == "changerLangue") {
                if (isset($params["langue"])) {
 
                    // On vérifie que le répertoire  de langue reçu existe 
                    if (file_exists( RACINE . "langues/" .  $params["langue"])) {
                        $_SESSION["langue"] = $params["langue"];  // On retient la langue dans la session
                        $existeSessionLangue = true;              // La variable de session langue existe.
    
                        // Si l'action pour le contrôleur existe, 
                        // il faut le lui faire exécuter en revenant dans le contrôleur, 
                        // une fois que le tableau de langue aura été déterminé. 
                        if (isset($params["controleur-action"])) {
                            $params["action"] = $params["controleur-action"];
                        }
                    } else {
                        trigger_error("la valeur du champ langue, '" .  $params["langue"] . "', n'existe pas");
                        //Efface le cache de se répertoire
                        clearstatcache(true, RACINE . "langues/" .  $params["langue"]);
                        unset($_SESSION["langue"]);
                    }
                } else {
                    trigger_error("champ langue non présent dans la requête");
                }
            } else if(isset($_SESSION["langue"])) {
                // On vérifie que le répertoire  de langue reçu existe 
                if (file_exists( RACINE . "langues/" .  $_SESSION["langue"])) {
                   $existeSessionLangue = true;  // La variable de session langue existe.
                } else {
                     trigger_error("la valeur du champ langue, '" .  $_SESSION["langue"] . "', n'existe pas");
                    //Efface le cache de se répertoire
                    clearstatcache(true, RACINE . "langues/" .  $_SESSION["langue"]);
                    unset($_SESSION["langue"]);

                }
            }
            
            // La langue choisi a prépondérance par rapport à la langue de l'usager
            // Il est a noter que la langue choisi peux être celle de l'usager de toute façon.
            if ($existeSessionLangue) {
                $langueAffichage =  $_SESSION["langue"];  // On prend la langue choisi.
            } else {
                // Si la varariable des sessions de l'usager, on prend sans langue choisi
                // car l'usager n'a pas changé la langue dans la page web.
                if (isset($_SESSION["usager"])) {
                    $langueAffichage = $_SESSION["usager"]->getCode(); 
                }
            } 

            return $langueAffichage;

        } // function trouveLangueAffichage

    } // abstract class

?>