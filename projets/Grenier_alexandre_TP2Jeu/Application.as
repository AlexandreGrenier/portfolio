package 
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;

	//pour les images
	import flash.display.Loader;
	import flash.net.URLRequest;

	//pour le son



	//pour les elements graphique




	public class Application extends Sprite
	{
		public var _menu:Sprite;

		public var _message:Message;

		public var _message2:Message2;

		public var _tableau:Tableau;

		public var _tableau2:Tableau2;

		public var _vieEnnemi:VieEnnemi;

		public var _vieEnnemiP:VieEnnemiP;

		public var _vieOurs:VieOurs;

		public var _vieOursP:VieOursP;

		public var _outch:Outch;

		public var _outch2:Outch2;

		public var _banque:Banque;
		
		public var _tableau3:Tableau3;


		//movie clips

		public var clipBouton_mc:ClipBouton;


		//loaders

		public var _brique1:Loader;

		public var _brique2:Loader;

		public var _splash:Loader;

		public var _fondPerso:Loader;

		public var _ours1:Loader;

		public var _ours2:Loader;

		public var _ours3:Loader;

		public var _ennemi1:Loader;

		public var _ennemi2:Loader;

		public var _ennemi3:Loader;

		public var _perdu:Loader;

		public var _victoire:Loader;

		//magasin et items

		public var _magasin:Loader;

		public var _bombeDroite:Loader;

		public var _capeDroite:Loader;

		public var _chapeauDroite:Loader;

		public var _sacocheDroite:Loader;

		public var _bombeGauche:Loader;

		public var _capeDerriere:Loader;

		public var _capeDevant:Loader;

		public var _chapeauGauche:Loader;

		public var _sacocheDerriere:Loader;

		public var _sacocheDevant:Loader;

		//pour le gameplay

		public var _ptsVie:int;

		public var _ptsVieReset:int;

		public var _dmgMax:int;

		public var _dmgMin:int;

		public var _ennemiVie:int;

		public var _dmg:int;

		public var _ennemiDmgMin:int;

		public var _ennemiDmgMax:int;

		public var _numeroEnnemi:int;

		public var _choixperso:int;

		public var _argent:int;

		public var _score:int;

		///pour les items/////////////////

		public var itemBombe:Boolean;
		public var itemSacoche:Boolean;
		public var itemChapeau:Boolean;
		public var itemCape:Boolean;


		//pour les liens vers les images
		public var _lienImage:URLRequest;


		public function Application()
		{
			this._lienImage = new URLRequest("images/splash.png");
			//On charge cette image et on l'affiche
			this._splash= new Loader();
			this._splash.load(this._lienImage);
			this.addChild(this._splash);
			mettreMenu();
		}
		public function mettreMenu():void
		{
			this._menu = new Sprite ();
			this.addChild(this._menu);

			var donneesMenu:Array = [["AIDE",afficherAide],["JOUER",choisirPerso]];

			var nbBoutons:int = donneesMenu.length;
			for (var i:int = 0; i < nbBoutons; i++)
			{
				var unClipBouton:ClipBouton = new ClipBouton();
				unClipBouton.y = 270;
				if (i==0)
				{
					unClipBouton.x = 15;
				}
				else
				{
					unClipBouton.x = ((this.stage.stageWidth) - 15) -unClipBouton.width;
				}

				unClipBouton.buttonMode = true;
				unClipBouton.mouseChildren = false;
				unClipBouton.nomTxt.text = donneesMenu[i][0];
				unClipBouton.addEventListener(MouseEvent.CLICK, donneesMenu[i][1]);
				this._menu.addChild(unClipBouton);
			}
		}
		public function afficherAide(pEvt:Event):void
		{
			if (this._message == null)
			{
				this._message = new Message();
				this._message.titreTxt.text = "AIDE";
				this._message.contenuTxt.text = "Si vous avez des difficultées veuillez contacter l'administrateur du jeu. (438) 555-9556 - Plus d'aide à venir...jblsdknf ";
				this._message.x = this.stage.stageWidth / 2;
				this._message.y = this.stage.stageHeight / 2;
				this.addChild(this._message);
			}
			else
			{
				this.removeChild(this._message);
				this._message = null;
			}
		}
		public function choisirPerso(pEvt:Event):void
		{
			if (this._message != null)
			{
				this.removeChild(this._message);
				this._message = null;
			}

			this.removeChild(this._menu);
			this._menu = null;

			//tuer le splash!!
			this.removeChild(this._splash);

			this._fondPerso = new Loader();
			this._lienImage.url = "images/fondPerso.png";
			this._fondPerso.load(this._lienImage);
			this._fondPerso.contentLoaderInfo.addEventListener(Event.COMPLETE,elementsperso);
		}
		public function elementsperso(pEvt:Event):void
		{

			this.addChild(this._fondPerso);

			_numeroEnnemi = 1;

			//ajout des ours

			this._ours1 = new Loader();
			this._lienImage.url = "images/ours1.png";
			this._ours1.load(this._lienImage);
			this.addChild(this._ours1);

			//ajout des tableaux
			this._tableau = new Tableau();
			this._tableau.dmgTxt.text = "1-6";
			this._tableau.vieTxt.text = "20";
			this._tableau.x +=  7;
			this._tableau.y +=  7;
			this.addChild(this._tableau);

			this._tableau2 = new Tableau2();
			this._tableau2.dmgTxt.text = "2-3";
			this._tableau2.vieTxt.text = "25";
			this._tableau2.x = ((this.stage.stageWidth) - 7) -_tableau.width;
			this._tableau2.y +=  7;
			this.addChild(this._tableau2);

			this._menu = new Sprite ();
			this.addChild(this._menu);

			var donneesMenu:Array = [["Gloomy",choixGloomy],["Princess",choixPrincess]];

			var nbBoutons:int = donneesMenu.length;
			for (var i:int = 0; i < nbBoutons; i++)
			{
				var unClipBouton:ClipBouton = new ClipBouton();
				unClipBouton.y = 270;
				if (i==0)
				{
					unClipBouton.x = 55;
				}
				else
				{
					unClipBouton.x = ((this.stage.stageWidth) - 55) -unClipBouton.width;
				}

				unClipBouton.buttonMode = true;
				unClipBouton.mouseChildren = false;
				unClipBouton.nomTxt.text = donneesMenu[i][0];
				unClipBouton.addEventListener(MouseEvent.CLICK, donneesMenu[i][1]);
				this._menu.addChild(unClipBouton);
			}


		}

		public function choixGloomy(pEvt:Event):void
		{
			this.removeChild(this._menu);
			this._menu = null;

			this.removeChild(this._fondPerso);

			this.removeChild(this._ours1);

			this.removeChild(this._tableau2);
			this.removeChild(this._tableau);

			this._ptsVie = 20;
			this._dmgMax = 6;
			this._dmgMin = 1;
			this._argent = 10;
			this._ptsVieReset = 20;

			this._brique1 = new Loader();
			this._lienImage.url = "images/brique1.png";
			this._brique1.load(this._lienImage);
			this.addChild(this._brique1);
			this._ours2 = new Loader();
			this._lienImage.url = "images/ours2.png";
			this._ours2.load(this._lienImage);
			this.addChild(this._ours2);

			this._choixperso = 1;

			this._tableau = new Tableau();
			this._tableau.dmgTxt.text = _dmgMin + "-" + _dmgMax;
			this._tableau.vieTxt.text = "" + _ptsVie;
			this._tableau.x +=  7;
			this._tableau.y +=  7;
			this.addChild(this._tableau);

			jouerJeu(null);

		}

		public function choixPrincess(pEvt:Event):void
		{
			this.removeChild(this._menu);
			this._menu = null;

			this.removeChild(this._fondPerso);

			this.removeChild(this._ours1);

			this.removeChild(this._tableau2);
			this.removeChild(this._tableau);

			this._ptsVie = 25;
			this._dmgMax = 3;
			this._dmgMin = 2;
			this._argent = 5;
			this._ptsVieReset = 25;

			this._brique1 = new Loader();
			this._lienImage.url = "images/brique1.png";
			this._brique1.load(this._lienImage);
			this.addChild(this._brique1);
			this._ours3 = new Loader();
			this._lienImage.url = "images/ours3.png";
			this._ours3.load(this._lienImage);
			this.addChild(this._ours3);
			this._choixperso = 2;

			this._tableau = new Tableau();
			this._tableau.dmgTxt.text = _dmgMin + "-" + _dmgMax;
			this._tableau.vieTxt.text = "" + _ptsVie;
			this._tableau.x +=  7;
			this._tableau.y +=  7;
			this.addChild(this._tableau);
			jouerJeu(null);
		}

		public function jouerJeu(pEvt:Event):void
		{


			this._message2 = new Message2();
			if (_numeroEnnemi ==1)
			{
				this._message2.titreTxt.text = "Premier Ennemi";
				this._message2.contenuTxt.text = "Le premier ennemi est un ours en peluche qui s'est fait maltraité par son propriétaire. Il n'as pas l'air très dificile à vaincre. Cliquez sur continuer pour commencer.";

			}
			if (_numeroEnnemi ==2)
			{
				this._message2.titreTxt.text = "BFM Ninja Duck";
				this._message2.contenuTxt.text = "Le Deuxieme ennemi n'a pas beaucoup de points de vie, mais il peut vous découper avec son Katana. BFM Ninja duck est une création de Guillaume Savard.";

			}
			if (_numeroEnnemi ==3)
			{
				this._message2.titreTxt.text = "Miraya";
				this._message2.contenuTxt.text = " Cette femme Robot se cherche un nouveau coeur...elle veut le VOTRE! Création de Stéphanie Langlois-Prince.";
			}

			this._message2.x = this.stage.stageWidth / 2;
			this._message2.y = this.stage.stageHeight / 2;
			this.addChild(this._message2);


			this._menu = new Sprite ();
			this.addChild(this._menu);

			var unClipBouton:ClipBouton = new ClipBouton();
			unClipBouton.y = 260;

			unClipBouton.x = (this.stage.stageWidth / 2 )-40;


			unClipBouton.buttonMode = true;
			unClipBouton.mouseChildren = false;
			unClipBouton.nomTxt.text = "Continuer";
			unClipBouton.addEventListener(MouseEvent.CLICK, commencer);
			this._menu.addChild(unClipBouton);

		}
		public function commencer(pEvt:Event):void
		{
			_ptsVie = _ptsVieReset;
			this._tableau.vieTxt.text = "" + _ptsVie;

			this.removeChild(this._message2);
			this.removeChild(this._menu);


			/////////////////ennemis///////////////
			if (_numeroEnnemi ==1)
			{
				this._ennemi1 = new Loader();
				this._lienImage.url = "images/ennemi1.png";
				this._ennemi1.load(this._lienImage);
				this.addChild(this._ennemi1);

				_ennemiDmgMin = 1;
				_ennemiDmgMax = 4;
				_ennemiVie = 20;
			}
			if (_numeroEnnemi ==2)
			{
				this._ennemi2 = new Loader();
				this._lienImage.url = "images/ennemi2.png";
				this._ennemi2.load(this._lienImage);
				this.addChild(this._ennemi2);

				_ennemiDmgMin = 1;
				_ennemiDmgMax = 9;
				_ennemiVie = 15;
			}

			if (_numeroEnnemi ==3)
			{
				this._ennemi3 = new Loader();
				this._lienImage.url = "images/ennemi3.png";
				this._ennemi3.load(this._lienImage);
				this.addChild(this._ennemi3);

				_ennemiDmgMin = 2;
				_ennemiDmgMax = 3;
				_ennemiVie = 50;
			}


			this._tableau2 = new Tableau2();
			this._tableau2.dmgTxt.text = _ennemiDmgMin + "-" + _ennemiDmgMax;
			this._tableau2.vieTxt.text = "" + _ennemiVie;
			this._tableau2.x = ((this.stage.stageWidth) - 7) -_tableau.width;
			this._tableau2.y +=  7;
			this.addChild(this._tableau2);

			////////////////////////////////masques
			this._vieOurs = new VieOurs  ;
			this._vieOurs.y = 50;
			this._vieOurs.x = (this.stage.stageWidth / 3);
			this.addChild(this._vieOurs);

			this._vieOursP = new VieOursP  ;
			this._vieOursP.y = 50;
			this._vieOursP.x = (this.stage.stageWidth / 3);
			this.addChild(this._vieOursP);


			this._vieEnnemi = new VieEnnemi  ;
			this._vieEnnemi.y = 40;
			this._vieEnnemi.x = (this.stage.stageWidth / 3)*2;
			this.addChild(this._vieEnnemi);

			this._vieEnnemiP = new VieEnnemiP  ;
			this._vieEnnemiP.y = 40;
			this._vieEnnemiP.x = (this.stage.stageWidth / 3)*2;
			this.addChild(this._vieEnnemiP);
			/////// fin masques ///////////////////////

			this._menu = new Sprite ();
			this.addChild(this._menu);

			var unClipBouton:ClipBouton = new ClipBouton();
			unClipBouton.y = 260;

			unClipBouton.x = ((this.stage.stageWidth / 2) - 55);


			unClipBouton.buttonMode = true;
			unClipBouton.mouseChildren = false;
			unClipBouton.nomTxt.text = "Attaquer!";
			unClipBouton.addEventListener(MouseEvent.CLICK, Attaquer);
			this._menu.addChild(unClipBouton);



		}
		public function Attaquer(pEvt:MouseEvent):void
		{
			this.removeChild(this._menu);
			this._menu = null;

			_dmg = _dmgMin + (Math.random() * ((_dmgMax-_dmgMin)+1));

			trace("DMG = "+_dmg);

			_argent = _argent + _dmg;

			trace("$ ="+ _argent);

			this._outch = new Outch();
			this._outch.alpha = 0;
			this._outch.x = this.stage.stageWidth / 2;
			this._outch.y = this.stage.stageHeight / 2;
			this._outch.outchTxt.text = "" + _dmg;
			this.addChild(_outch);

			_ennemiVie = (_ennemiVie - _dmg);

			this._outch.addEventListener(Event.ENTER_FRAME, apparaitre);

		}

		public function contreAttaque(pEvt:Event):void
		{
			_dmg = _ennemiDmgMin + (Math.random() * ((_ennemiDmgMax-_ennemiDmgMin)+1));

			trace("DMG = "+_dmg);

			_argent = _argent - _dmg;

			trace("$ ="+ _argent);

			this._outch2 = new Outch2();
			this._outch2.alpha = 0;
			this._outch2.x = this.stage.stageWidth / 2;
			this._outch2.y = this.stage.stageHeight / 2;
			this._outch2.outchTxt.text = "" + _dmg;
			this.addChild(_outch2);

			_ptsVie = (_ptsVie - _dmg);

			this._outch2.addEventListener(Event.ENTER_FRAME, apparaitreD);

		}
		public function apparaitre(pEvt:Event):void
		{
			pEvt.currentTarget.alpha +=  0.1;

			if (pEvt.currentTarget.alpha >= 2)
			{
				pEvt.currentTarget.removeEventListener(Event.ENTER_FRAME, apparaitre);
				pEvt.currentTarget.addEventListener(Event.ENTER_FRAME, disparaitre);
			}
		}

		public function disparaitre(pEvt:Event):void
		{
			pEvt.currentTarget.alpha -=  0.1;

			if (pEvt.currentTarget.alpha <= 0)
			{
				pEvt.currentTarget.removeEventListener(Event.ENTER_FRAME, disparaitre);
				this.removeChild(_outch);
				this._tableau2.vieTxt.text = "" + _ennemiVie;

				if (_ennemiVie <= 0 )
				{
					victoire(null);
				}
				else
				{
					contreAttaque(null);
				}

			}
		}
		public function apparaitreD(pEvt:Event):void
		{
			pEvt.currentTarget.alpha +=  0.1;

			if (pEvt.currentTarget.alpha >= 2)
			{
				pEvt.currentTarget.removeEventListener(Event.ENTER_FRAME, apparaitreD);
				pEvt.currentTarget.addEventListener(Event.ENTER_FRAME, disparaitreD);
			}
		}

		public function disparaitreD(pEvt:Event):void
		{
			pEvt.currentTarget.alpha -=  0.1;

			if (pEvt.currentTarget.alpha <= 0)
			{
				pEvt.currentTarget.removeEventListener(Event.ENTER_FRAME, disparaitreD);
				this.removeChild(_outch2);
				this._tableau.vieTxt.text = "" + _ptsVie;


				if (_ptsVie <= 0 )
				{
					defaite(null);

				}
				else
				{

					this._menu = new Sprite ();
					this.addChild(this._menu);

					var unClipBouton:ClipBouton = new ClipBouton();
					unClipBouton.y = 260;

					unClipBouton.x = ((this.stage.stageWidth / 2) - 55);


					unClipBouton.buttonMode = true;
					unClipBouton.mouseChildren = false;
					unClipBouton.nomTxt.text = "Attaquer!";
					unClipBouton.addEventListener(MouseEvent.CLICK, Attaquer);
					this._menu.addChild(unClipBouton);
				}
			}
		}

		public function victoire(pEvt:Event):void
		{
			if (_numeroEnnemi ==3)
			{
				victoireJeu(null);
			}
			else
			{
				if (_argent<=0)
				{
					_argent = 0;
				}
				_argent = _ptsVie + _argent;
				this._message2 = new Message2();
				this._message2.titreTxt.text = "Victoire";
				this._message2.contenuTxt.text = "Vous avez terraser votre ennemi. Bravo! Vous avez maintenant: " + _argent + " pièces d'or";
				this._message2.x = this.stage.stageWidth / 2;
				this._message2.y = this.stage.stageHeight / 2;
				this.addChild(this._message2);

				this.removeChild(this._vieOurs);
				this.removeChild(this._vieOursP);
				this.removeChild(this._vieEnnemi);
				this.removeChild(this._vieEnnemiP);
				this.removeChild(_tableau2);
				if (_numeroEnnemi ==3)
				{
					this.removeChild(_ennemi3);
					_numeroEnnemi = 4;
				}
				if (_numeroEnnemi ==2)
				{
					this.removeChild(_ennemi2);
					_numeroEnnemi = 3;
				}
				if (_numeroEnnemi ==1)
				{
					this.removeChild(_ennemi1);
					_numeroEnnemi = 2;
				}

				this._menu = new Sprite ();
				this.addChild(this._menu);

				var unClipBouton:ClipBouton = new ClipBouton();
				unClipBouton.y = 260;

				unClipBouton.x = ((this.stage.stageWidth / 2) - 55);


				unClipBouton.buttonMode = true;
				unClipBouton.mouseChildren = false;
				unClipBouton.nomTxt.text = "Magasin";
				unClipBouton.addEventListener(MouseEvent.CLICK, magasiner);
				this._menu.addChild(unClipBouton);
			}
		}

		public function magasiner(pEvt:Event):void
		{
			this.removeChild(this._message2);
			this.removeChild(this._menu);
			this._menu = null;

			this._brique2 = new Loader();
			this._lienImage.url = "images/brique2.png";
			this._brique2.load(this._lienImage);
			this.addChildAt(this._brique2, 1);

			this._magasin = new Loader();
			this._lienImage.url = "images/tablette.png";
			this._magasin.load(this._lienImage);
			this.addChild(this._magasin);

			if ( itemBombe == false)
			{
				this._bombeDroite = new Loader();
				this._lienImage.url = "images/bombeDroite.png";
				this._bombeDroite.load(this._lienImage);
				this.addChild(this._bombeDroite);
			}

			if ( itemSacoche == false)
			{
				this._sacocheDroite = new Loader();
				this._lienImage.url = "images/sacocheDroite.png";
				this._sacocheDroite.load(this._lienImage);
				this.addChild(this._sacocheDroite);
			}

			if ( itemCape == false)
			{
				this._capeDroite = new Loader();
				this._lienImage.url = "images/capeDroite.png";
				this._capeDroite.load(this._lienImage);
				this.addChild(this._capeDroite);
			}

			if ( itemChapeau == false)
			{
				this._chapeauDroite = new Loader();
				this._lienImage.url = "images/chapeauDroite.png";
				this._chapeauDroite.load(this._lienImage);
				this.addChild(this._chapeauDroite);
			}

			this._banque = new Banque();
			this._banque.x = this.stage.stageWidth - this._banque.width - 9;
			this._banque.y = 40;
			this._banque.argentTxt.text = "" + _argent;
			this.addChild(_banque);
			
			this._tableau3 = new Tableau3();
			this._tableau3.dmgTxt.text = "";
			this._tableau3.vieTxt.text = "";
			this._tableau3.argentTxt.text = "";
			this._tableau3.descriptionTxt.text = "";
			this._tableau3.x =  this.stage.stageWidth -160 ;
			this._tableau3.y += 240;
			this.addChild(this._tableau3);
			
			menuMagasin(null);
		}

		public function menuMagasin(pEvt:Event):void
		{

			this._menu = new Sprite ();
			this.addChild(this._menu);

			var donneesMenu:Array = [["continuer",apresmagasin],["Chapeau",acchatChapeau, infoChapeau],["Cape",acchatCape, infoCape],["Bombe",acchatBombe, infoBombe],["Sacoche",acchatSacoche, infoSacoche]];

			var nbBoutons:int = donneesMenu.length;
			for (var i:int = 0; i < nbBoutons; i++)
			{
				var unClipBouton:ClipBouton = new ClipBouton();
				if (i==0)
				{
					unClipBouton.y = 260;
				}
				else
				{
					unClipBouton.y = (i * 50) - 20;
					unClipBouton.addEventListener(MouseEvent.MOUSE_OVER, donneesMenu[i][2])

				}
				unClipBouton.x = ((this.stage.stageWidth / 2) - 55);
				unClipBouton.buttonMode = true;
				unClipBouton.mouseChildren = false;
				unClipBouton.nomTxt.text = donneesMenu[i][0];
				unClipBouton.addEventListener(MouseEvent.CLICK, donneesMenu[i][1]);
				this._menu.addChild(unClipBouton);
			}



		}
		public function defaite(pEvt:Event):void
		{
			if (_choixperso == 1)
			{
				this.removeChild(this._ours2);

			}
			if (_choixperso == 2)
			{
				this.removeChild(this._ours3);
			}

			this.removeChild(this._vieOurs);
			this.removeChild(this._vieOursP);
			this.removeChild(this._vieEnnemi);
			this.removeChild(this._vieEnnemiP);
			this.removeChild(_tableau2);
			this.removeChild(_tableau);
			this.removeChild(_brique1);

			if (_numeroEnnemi ==3)
			{
				this.removeChild(_ennemi3);
				_numeroEnnemi = 0;
			}
			if (_numeroEnnemi ==2)
			{
				this.removeChild(_ennemi2);
				_numeroEnnemi = 0;
			}
			if (_numeroEnnemi ==1)
			{
				this.removeChild(_ennemi1);
				_numeroEnnemi = 0;
			}


			this._perdu = new Loader();
			this._lienImage.url = "images/perdu.png";
			this._perdu.load(this._lienImage);
			this.addChild(this._perdu);

			this._menu = new Sprite ();
			this.addChild(this._menu);

			var unClipBouton:ClipBouton = new ClipBouton();
			unClipBouton.y = 260;

			unClipBouton.x = ((this.stage.stageWidth / 2) - 55);


			unClipBouton.buttonMode = true;
			unClipBouton.mouseChildren = false;
			unClipBouton.nomTxt.text = "Rejouer";
			unClipBouton.addEventListener(MouseEvent.CLICK, rejouer);
			this._menu.addChild(unClipBouton);

		}
		public function victoireJeu(pEvt:Event):void
		{
			if (_choixperso == 1)
			{
				this.removeChild(this._ours2);

			}
			if (_choixperso == 2)
			{
				this.removeChild(this._ours3);
			}

			this.removeChild(this._vieOurs);
			this.removeChild(this._vieOursP);
			this.removeChild(this._vieEnnemi);
			this.removeChild(this._vieEnnemiP);
			this.removeChild(_tableau2);
			this.removeChild(_tableau);
			this.removeChild(_brique1);

			if (_numeroEnnemi ==3)
			{
				this.removeChild(_ennemi3);
				_numeroEnnemi = 4;
			}
			if (_numeroEnnemi ==2)
			{
				this.removeChild(_ennemi2);
				_numeroEnnemi = 0;
			}
			if (_numeroEnnemi ==1)
			{
				this.removeChild(_ennemi1);
				_numeroEnnemi = 0;
			}


			this._victoire = new Loader();
			this._lienImage.url = "images/victoire.png";
			this._victoire.load(this._lienImage);
			this.addChild(this._victoire);

			this._menu = new Sprite ();
			this.addChild(this._menu);

			var unClipBouton:ClipBouton = new ClipBouton();
			unClipBouton.y = 260;

			unClipBouton.x = ((this.stage.stageWidth / 2) - 55);


			unClipBouton.buttonMode = true;
			unClipBouton.mouseChildren = false;
			unClipBouton.nomTxt.text = "Rejouer";
			unClipBouton.addEventListener(MouseEvent.CLICK, rejouer);
			this._menu.addChild(unClipBouton);

		}

		public function apresmagasin(pEvt:Event):void
		{
			this.removeChild(this._menu);
			this._menu = null;

			this.removeChild(this._brique2);
			this.removeChild(this._magasin);

			this.removeChild(this._banque);
			
			this.removeChild(this._tableau3);


			if ( itemBombe == false)
			{
				this.removeChild(this._bombeDroite);
			}

			if ( itemSacoche == false)
			{
				this.removeChild(this._sacocheDroite);
			}

			if ( itemCape == false)
			{
				this.removeChild(this._capeDroite);
			}

			if ( itemChapeau == false)
			{
				this.removeChild(this._chapeauDroite);
			}

			jouerJeu(null);

		}
		public function infoChapeau(pEvt:MouseEvent):void
		{ trace ("chapeau");
		
			this._tableau3.dmgTxt.text = "+1 - +0";
			this._tableau3.vieTxt.text = "+0";
			this._tableau3.argentTxt.text = "10$";
			this._tableau3.descriptionTxt.text = "Chapeau";	
		}
		
		public function infoBombe(pEvt:MouseEvent):void
		{trace ("bombe");
		
			this._tableau3.dmgTxt.text = "+0 - +2";
			this._tableau3.vieTxt.text = "+0";
			this._tableau3.argentTxt.text = "15$";
			this._tableau3.descriptionTxt.text = "Bombe";
		}
		
		public function infoSacoche(pEvt:MouseEvent):void
		{trace ("Sacoche");
		
			this._tableau3.dmgTxt.text = "+1 - +1";
			this._tableau3.vieTxt.text = "+0";
			this._tableau3.argentTxt.text = "15$";
			this._tableau3.descriptionTxt.text = "Sacoche";
		}
		
		public function infoCape(pEvt:MouseEvent):void
		{trace ("Cape");
		
			this._tableau3.dmgTxt.text = "+0 - +0";
			this._tableau3.vieTxt.text = "+7";
			this._tableau3.argentTxt.text = "12$";
			this._tableau3.descriptionTxt.text = "Cape";
		}

		public function acchatSacoche(pEvt:Event):void
		{
			if (_argent >=15)
			{
				if ( itemSacoche == false)
				{
					_argent = (_argent - 15);


					this.removeChild(this._menu);
					this._menu = null;

					this.removeChild(this._sacocheDroite);


					this._sacocheDerriere = new Loader();
					this._lienImage.url = "images/sacocheDerriere.png";
					this._sacocheDerriere.load(this._lienImage);
					this.addChildAt(this._sacocheDerriere,2);

					this._sacocheDevant = new Loader();
					this._lienImage.url = "images/sacocheDevant.png";
					this._sacocheDevant.load(this._lienImage);
					this.addChild(this._sacocheDevant);


					this._dmgMax = this._dmgMax + 1;
					this._dmgMin = this._dmgMin + 1;

					this._tableau.dmgTxt.text = _dmgMin + "-" + _dmgMax;


					this._banque.argentTxt.text = "" + _argent;
					itemSacoche = true;
					menuMagasin(null);
				}
			}
		}
		public function acchatCape(pEvt:Event):void
		{
			if (_argent >=12)
			{
				if ( itemCape == false)
				{
					_argent = (_argent - 12);


					this.removeChild(this._menu);
					this._menu = null;

					this.removeChild(this._capeDroite);


					this._capeDerriere = new Loader();
					this._lienImage.url = "images/capeDerriere.png";
					this._capeDerriere.load(this._lienImage);
					this.addChildAt(this._capeDerriere,2);

					this._capeDevant = new Loader();
					this._lienImage.url = "images/capeDevant.png";
					this._capeDevant.load(this._lienImage);
					this.addChild(this._capeDevant);


					this._ptsVieReset = this._ptsVieReset + 7;

					this._tableau.vieTxt.text = "" + _ptsVie;

					this._banque.argentTxt.text = "" + _argent;
					itemCape = true;
					menuMagasin(null);
				}
			}
		}
		public function acchatBombe(pEvt:Event):void
		{
			if (_argent >=15)
			{
				if ( itemBombe == false)
				{
					_argent = (_argent - 15);


					this.removeChild(this._menu);
					this._menu = null;

					this.removeChild(this._bombeDroite);

					this._bombeGauche = new Loader();
					this._lienImage.url = "images/bombeGauche.png";
					this._bombeGauche.load(this._lienImage);
					this.addChild(this._bombeGauche);


					this._dmgMax = this._dmgMax + 2;
					this._tableau.dmgTxt.text = _dmgMin + "-" + _dmgMax;

					this._banque.argentTxt.text = "" + _argent;
					itemBombe = true;
					menuMagasin(null);
				}
			}
		}
		public function acchatChapeau(pEvt:Event):void
		{
			if (_argent >=10)
			{
				if ( itemChapeau == false)
				{
					_argent = (_argent - 10);


					this.removeChild(this._menu);
					this._menu = null;

					this.removeChild(this._chapeauDroite);

					this._chapeauGauche = new Loader();
					this._lienImage.url = "images/chapeauGauche.png";
					this._chapeauGauche.load(this._lienImage);
					this.addChild(this._chapeauGauche);


					this._dmgMin = this._dmgMin + 1;
					this._tableau.dmgTxt.text = _dmgMin + "-" + _dmgMax;

					this._banque.argentTxt.text = "" + _argent;
					itemChapeau = true;
					menuMagasin(null);
				}
			}
		}

		public function rejouer(pEvt:Event):void
		{
			if (this._numeroEnnemi == 4)
			{
				this.removeChild(this._victoire);
			}
			else
			{
				this.removeChild(this._perdu);
			}

			/////enlerver les items des perso///////
			if ( itemBombe == true)
			{
				this.removeChild(this._bombeGauche);
				itemBombe = false;
			}

			if ( itemSacoche == true)
			{
				this.removeChild(this._sacocheDevant);
				this.removeChild(this._sacocheDerriere);
				itemSacoche = false;
			}

			if ( itemCape == true)
			{
				this.removeChild(this._capeDevant);
				this.removeChild(this._capeDerriere);
				itemCape = false;
			}

			if ( itemChapeau == true)
			{
				this.removeChild(this._chapeauGauche);
				itemChapeau = false;
			}


			this.removeChild(this._menu);
			this._menu = null;


			this._lienImage = new URLRequest("images/splash.png");
			this._splash= new Loader();
			this._splash.load(this._lienImage);
			this.addChild(this._splash);
			mettreMenu();

		}

	}

}