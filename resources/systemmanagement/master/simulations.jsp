    <html>
        <head>
        <title>DMASON - System Management</title>
        <link rel="shortcut icon" type="image/png" href="images/dmason-ico.png"/>
        <!-- Polyfill Web Components for older browsers -->
        <script src="bower_components/webcomponentsjs/webcomponents-lite.min.js"></script>

        <!-- Custom Polymer CSS -->
        <link rel="import" href="style/polymer/styles-polymer.html">

        <!-- Custom CSS -->
        <link href="style/custom-style.css" rel="stylesheet" type="text/css">


        <!-- jquery -->
        <script src="js/jquery-1.12.0.min.js"></script>

        <!-- Mansory lib -->
        <script src="js/masonry.pkgd.min.js"></script>


        <!-- Custom Scripts -->
        <script src="js/script.js"></script>
        <script src="bower_components/highcharts/highcharts.js"></script>
        <script src="bower_components/highcharts/highcharts-more.js"></script>

        <!-- Import element -->
        <link rel="import" href="bower_components/paper-icon-button/paper-icon-button.html">
        <link rel="import" href="bower_components/paper-toolbar/paper-toolbar.html">
        <link rel="import" href="bower_components/paper-drawer-panel/paper-drawer-panel.html">
        <link rel="import" href="bower_components/paper-scroll-header-panel/paper-scroll-header-panel.html">
        <link rel="import" href="bower_components/paper-menu/paper-menu.html">
        <link rel="import" href="bower_components/paper-item/paper-item.html">
        <link rel="import" href="bower_components/paper-fab/paper-fab.html">
        <link rel="import" href="bower_components/paper-styles/paper-styles.html">
        <link rel="import" href="bower_components/paper-fab/paper-fab.html">
        <link rel="import" href="bower_components/paper-toast/paper-toast.html">
        <link rel="import" href="bower_components/paper-dialog/paper-dialog.html">
        <link rel="import" href="bower_components/paper-button/paper-button.html">
        <link rel="import" href="bower_components/paper-radio-button/paper-radio-button.html">
        <link rel="import" href="bower_components/paper-radio-group/paper-radio-group.html">
        <link rel="import" href="bower_components/paper-input/paper-input.html">
        <link rel="import" href="bower_components/paper-progress/paper-progress.html">
        <link rel="import" href="bower_components/paper-dialog-scrollable/paper-dialog-scrollable.html">"
        <link rel="import" href="bower_components/paper-spinner/paper-spinner.html">


        <link rel="import" href="bower_components/iron-icons/iron-icons.html">
        <link rel="import" href="bower_components/iron-flex-layout/iron-flex-layout.html">
        <link rel="import" href="bower_components/iron-image/iron-image.html">
        <link rel="import" href="bower_components/iron-icons/image-icons.html">



        <link rel="import" href="bower_components/neon-animation/neon-animated-pages.html">
        <link rel="import" href="bower_components/neon-animation/neon-animations.html">
        <link rel="import" href="bower_components/custom_components/simulation/animated-grid.html">
        <link rel="import" href="bower_components/custom_components/simulation/fullsize-page-with-card.html">

        </head>
        <!--body unresolved onload="load_tiles_simulations()"-->
        <body unresolved>

        <paper-drawer-panel force-narrow >
        <paper-scroll-header-panel drawer id="side-header-panel" fixed fill>
        <paper-toolbar class="side-drawer">
        <div>Control Panel</div>
        <paper-icon-button icon="chevron-left" paper-drawer-toggle ></paper-icon-button>
        </paper-toolbar>
        <div class="content content-side-bar">
        <hr>
        <paper-menu>
        <paper-item ><a  href="index.jsp"> <iron-icon icon="icons:flip-to-front"></iron-icon><span class="span-icon">Monitoring</span></a></paper-item>
        <paper-item class="selected"><a  href="simulations.jsp"><iron-icon icon="image:blur-on"></iron-icon><span class="span-icon">Simulations</span></a></paper-item>
        <paper-item><a  href="history.jsp"><iron-icon icon="history"></iron-icon><span class="span-icon">History</span></a></paper-item>
        <paper-item><a  href="settings.jsp"><iron-icon icon="settings"></iron-icon><span class="span-icon">Settings</span></a></paper-item>
        </paper-menu>
        </div>
        </paper-scroll-header-panel>

        <paper-scroll-header-panel main fixed>
        <paper-toolbar flex id="mainToolBar">
        <paper-icon-button icon="menu" paper-drawer-toggle ></paper-icon-button>
        <span>DMASON Master</span>
        </paper-toolbar>

        <div class="content content-main">
            <template is="dom-bind" id="simulations">
                <neon-animated-pages id="pages" selected="0">
                        <animated-grid id="list_simulations" on-tile-click="_onTileClick" on-update-sim-event="_onUpdateSimEvent"></animated-grid>
                        <!--animated-grid id="list_simulations" on-tile-click="_onTileClick"></animated-grid-->
                        <fullsize-page-with-card id="fullsize_card" on-go-back="_onFullsizeClick">
                        </fullsize-page-with-card>
                </neon-animated-pages>
            </template>
            <paper-dialog id="load_sim_log_file"  entry-animation="scale-up-animation" exit-animation="fade-out-animation" modal>
                <div class="layout horizontal center">
                    <paper-spinner class="multi" active alt="Loading simulations list"></paper-spinner>
                    <span>Loading.....</span>
                </div>
            </paper-dialog>

        <script>
        var scope = document.querySelector('template[is="dom-bind"]');

        scope.addEventListener('dom-change', function(event){update_simulation_info()});



        scope._onTileClick = function(event) {
            var _sim = event.detail.data;
            this.$['fullsize_card'].sim = _sim;
            open_dialog_by_ID("load_sim_log_file");
            getListFile(_sim.id);
      /*  var lf=[];
        for(i=0; i<110;i++)
            lf[i]={fileName:'file'+i,modifiedDate:"22/01/2016"};

            this.$['fullsize-card'].listFile =lf;
            this.$.pages.selected = 1;*/
        };


        scope._onUpdateSimEvent = function(event){
            this.$['fullsize_card'].sim =event.detail.data;
        };
        scope._onFullsizeClick = function(event){
             this.$.pages.selected = 0;
        };

        /*
        scope._onSubmitSim = function(event){
             var id = event.target.parentElement.id;
             var op = event.detail.data;
             id=id.substring(id.indexOf("-")+1,id.length);

            $.ajax({
                url:"simulationController",
                data:"id="+id+"&op="+op
            });

        };*/
        </script>

        </div>
        </paper-scroll-header-panel>

        </paper-drawer-panel>

        </body>
        </html>
