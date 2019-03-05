DROP TABLE COMMANDE;
DROP TABLE PANIER;
DROP TABLE CLIENT;
DROP TABLE CATALOGUE;
DROP TABLE PRODUIT;
DROP TABLE SSFAMILLE;
DROP TABLE FAMILLE;
DROP TABLE COULEUR;
DROP TABLE FABRICANT;


CREATE TABLE FABRICANT (
		ID_FABRICANT		        int		 			NOT NULL	PRIMARY KEY	,
        NOM_FABRICANT		        varchar2(50)		NOT NULL				
);

CREATE TABLE COULEUR (
	ID_COULEUR			            int					NOT NULL	PRIMARY KEY	,
	INTITULE_COULEUR	            varchar2(80)		NOT NULL				,
	HEXA_ROUGE			            varchar2(2)			NOT NULL				,
	HEXA_VERT			            varchar2(2)			NOT NULL				,
	HEXA_BLEU			            varchar2(2)			NOT NULL				,
	RVB_ROUGE			            int					NOT NULL				,
	RVB_VERT			            int					NOT NULL				,
	RVB_BLEU			            int					NOT NULL				,
	REF_HEXA			            varchar2(7)			NOT NULL				
);

 
CREATE TABLE FAMILLE (
    	ID_FAMILLE			        int					NOT NULL	PRIMARY KEY	,
        NOM_FAMILLE			        varchar2(50)		NOT NULL				
);


CREATE TABLE SSFAMILLE (
    	ID_SSFAMILLE	        	int					NOT NULL	PRIMARY KEY	,
    	NOM_SSFAMILLE               varchar2(50)		NOT NULL					
);

CREATE TABLE PRODUIT (
        ID_PRODUIT			        int					NOT NULL	PRIMARY KEY	,
        NOM_PRODUIT		        	varchar2(100)		NOT NULL				,
        ID_FABRICANT_PRODUIT		int			 		NOT NULL				,
        ID_FAMILLE_PRODUIT       	int		 			NOT NULL				,
        ID_SSFAMILLE_PRODUIT        int					NOT NULL				,
	
	CONSTRAINT FK_Produit_ID_FABRICANT 		FOREIGN KEY (ID_FABRICANT_PRODUIT) 	REFERENCES FABRICANT (ID_FABRICANT),
	CONSTRAINT FK_Produit_ID_FAMILLE 		FOREIGN KEY (ID_FAMILLE_PRODUIT) 	REFERENCES FAMILLE   (ID_FAMILLE),
	CONSTRAINT FK_Produit_ID_SSFAMILLE 		FOREIGN KEY (ID_SSFAMILLE_PRODUIT) 	REFERENCES SSFAMILLE (ID_SSFAMILLE)
);

CREATE TABLE CATALOGUE (
	PRIX_UNITAIRE		            decimal 			NOT NULL				,
	STOCK				            int 	    		NOT NULL				,
	ID_COULEUR			            int					NOT NULL				,
	ID_PRODUIT			            int					NOT NULL				,

	CONSTRAINT FK_CATALOGUE_ID_Couleur 	FOREIGN KEY (ID_COULEUR) REFERENCES COULEUR (ID_COULEUR),
	CONSTRAINT FK_CATALOGUE_ID_Produit 	FOREIGN KEY (ID_PRODUIT) REFERENCES PRODUIT (ID_PRODUIT),
	CONSTRAINT CATALOGUE				PRIMARY KEY	(ID_COULEUR, ID_PRODUIT)
);

CREATE TABLE CLIENT (
	IDENTIFIANT_CLIENT	            int			        NOT NULL	PRIMARY KEY	,
	MDP_CLIENT			            varchar2(50)        NOT NULL				
	
);

CREATE TABLE PANIER (
	ID_PANIER			            int					NOT NULL	PRIMARY KEY	,
	IDENTIFIANT_CLIENT	            int					NOT NULL				,
    VALIDE                          int                                         ,
	
	CONSTRAINT FK_Panier_Identifiant_Client FOREIGN KEY (Identifiant_Client)REFERENCES CLIENT (Identifiant_Client)
);

CREATE TABLE COMMANDE (
	ID_PANIER			            int					NOT NULL				,
	ID_PRODUIT			            int					NOT NULL				,
	ID_COULEUR			            int					NOT NULL				,
	QTE_COMMANDE		            int					NOT NULL				,
	PRIX_VENTE			            decimal				NOT NULL				,
	
	CONSTRAINT FK_Commande_ID_Panier 	    FOREIGN KEY (ID_Panier)     REFERENCES PANIER (ID_Panier),
	CONSTRAINT FK_Commande_ID_Couleur       FOREIGN KEY (ID_Couleur)    REFERENCES COULEUR (ID_Couleur),
	CONSTRAINT FK_Commande_ID_Produit       FOREIGN KEY (ID_Produit)    REFERENCES PRODUIT (ID_Produit),
	constraint COMMANDE 				    PRIMARY KEY	(ID_PANIER, ID_PRODUIT, ID_COULEUR)	
);


