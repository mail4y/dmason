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

        <!-- Import element -->
        <link rel="import" href="bower_components/paper-fab/paper-fab.html">
        <link rel="import" href="bower_components/paper-icon-button/paper-icon-button.html">
        <link rel="import" href="bower_components/paper-toolbar/paper-toolbar.html">
        <link rel="import" href="bower_components/paper-drawer-panel/paper-drawer-panel.html">
        <link rel="import" href="bower_components/paper-scroll-header-panel/paper-scroll-header-panel.html">
        <link rel="import" href="bower_components/paper-menu/paper-menu.html">
        <link rel="import" href="bower_components/paper-item/paper-item.html">
        <link rel="import" href="bower_components/paper-styles/paper-styles.html">
        <link rel="import" href="bower_components/paper-dialog-scrollable/paper-dialog-scrollable.html">"
        <link rel="import" href="bower_components/paper-dialog/paper-dialog.html">
        <link rel="import" href="bower_components/paper-spinner/paper-spinner.html">
        <link rel="import" href="bower_components/neon-animation/animations/scale-up-animation.html">
        <link rel="import" href="bower_components/neon-animation/animations/fade-out-animation.html">
        <link rel="import" href="bower_components/paper-toast/paper-toast.html">
        <link rel="import" href="bower_components/iron-icons/iron-icons.html">
        <link rel="import" href="bower_components/iron-flex-layout/iron-flex-layout.html">
        <link rel="import" href="bower_components/iron-image/iron-image.html">
        <link rel="import" href="bower_components/iron-icons/image-icons.html">
        <link rel="import" href="bower_components/iron-icons/editor-icons.html">
        <link rel="import" href="bower_components/paper-badge/paper-badge.html">


        <link rel="import" href="bower_components/custom_components/history/sim-history-grid.html">

        </head>
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
        <paper-item><a  href="simulations.jsp"><iron-icon icon="image:blur-on"></iron-icon><span class="span-icon">Simulations</span></a></paper-item>
        <paper-item class="selected"><a style="text-decoration:none;" href="history.jsp"><iron-icon icon="history"></iron-icon><span class="span-icon">History</span></a></paper-item>
        <paper-item><a href="settings.jsp"><iron-icon icon="settings"></iron-icon><span class="span-icon">Settings</span></a></paper-item>
        </paper-menu>
        </div>
        </paper-scroll-header-panel>
        <paper-scroll-header-panel main fixed>
        	<paper-toolbar flex id="mainToolBar" class="horizontal">
        	 <div><paper-icon-button icon="menu" paper-drawer-toggle ></paper-icon-button></div>
              <div class="flex"><span>DMASON Master</span></div>
              <div onclick="cleanHistory()" class="cleanAllHistory"><paper-icon-button icon="select-all"></paper-icon-button><span>Clean all history</span></div>
        	</paper-toolbar>

        <div class="content content-main">
            <paper-dialog opened id="load_history_dialog"  entry-animation="scale-up-animation" exit-animation="fade-out-animation" modal>

                <div class="layout horizontal center">
                    <paper-spinner class="multi" active alt="Loading history"></paper-spinner>
                    <span>Loading history...</span>
                </div>

            </paper-dialog>
            <template is="dom-bind" id="workbench_template">
                <neon-animated-pages id="history_animated_pages" selected="0">

                    <sim-history-grid id="sim_history_grid"></sim-history-grid>
                    <workbench></workbench>
                </neon-animated-pages>
            </template>
        </div>
        </paper-scroll-header-panel>

        </paper-drawer-panel>
        <paper-fab id="delete-history-button" icon="cancel" onclick="cleanSelectedHistory()"></paper-fab>
        <paper-fab id="go_to_workbenck" icon="editor:insert-chart"></paper-fab>
        <paper-toast id="miss-history-delete">You need select some Simulations to delete</paper-toast>
        </body>
        </html>
