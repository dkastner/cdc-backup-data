// *************************************************************//  CLIENT_SIDE SNIFFER CODE// *************************************************************// convert all characters to lowercase to simplify testing var agt=navigator.userAgent.toLowerCase(); // *** BROWSER VERSION *** // Note: On IE5, these return 4, so use is_ie5up to detect IE5. var is_major = parseInt(navigator.appVersion); var is_minor = parseFloat(navigator.appVersion); // *** BROWSER TYPE *** var is_nav  = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)             && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)             && (agt.indexOf('webtv')==-1));var is_nav4up = (is_nav && (is_major >= 4));  var is_ie   = (agt.indexOf("msie") != -1); var is_ie3  = (is_ie && (is_major < 4)); var is_ie4  = (is_ie && (is_major == 4) && (agt.indexOf("msie 5.0")==-1) );var is_ie5  = (is_ie && (is_major == 4) && (agt.indexOf("msie 5.0")!=-1) );  var is_ie5up  = (is_ie  && !is_ie3 && !is_ie4);  // *** PLATFORM ***var is_win   = ( (agt.indexOf("win")!=-1) || (agt.indexOf("16bit")!=-1) );var is_mac    = (agt.indexOf("mac")!=-1);var is_sun   = (agt.indexOf("sunos")!=-1);var is_irix  = (agt.indexOf("irix") !=-1);    // SGIvar is_hpux  = (agt.indexOf("hp-ux")!=-1);var is_aix   = (agt.indexOf("aix") !=-1);      // IBMvar is_linux = (agt.indexOf("inux")!=-1);var is_sco   = (agt.indexOf("sco")!=-1) || (agt.indexOf("unix_sv")!=-1);var is_unixware = (agt.indexOf("unix_system_v")!=-1); var is_mpras    = (agt.indexOf("ncr")!=-1); var is_reliant  = (agt.indexOf("reliantunix")!=-1);var is_dec   = ((agt.indexOf("dec")!=-1) || (agt.indexOf("osf1")!=-1) ||        (agt.indexOf("dec_alpha")!=-1) || (agt.indexOf("alphaserver")!=-1) ||        (agt.indexOf("ultrix")!=-1) || (agt.indexOf("alphastation")!=-1)); var is_sinix = (agt.indexOf("sinix")!=-1);var is_freebsd = (agt.indexOf("freebsd")!=-1);var is_bsd = (agt.indexOf("bsd")!=-1);var is_unix  = ((agt.indexOf("x11")!=-1) || is_sun || is_irix || is_hpux ||              is_sco ||is_unixware || is_mpras || is_reliant ||              is_dec || is_sinix || is_aix || is_linux || is_bsd || is_freebsd);//Print Functionalityfunction printPage() {	if (window.print) {		window.print();	}	else if (agt.indexOf("mac") != -1) {		alert("Press 'Cmd+p' on your keyboard to print this page.");	}	else {		alert("Press 'Ctrl+p' on your keyboard to print this page.")	}}//Print PopUp Windowfunction openPrint(theURL) { 	window.open(theURL,'Popup','toolbar=1,location=1,status=1,menubar=1,scrollbars=1,resizable=1,screenX=10,screenY=10,left=10,top=10,width=500,height=400');}//Open Email This Page Windowfunction openEmail(thePath) { 	window.open(thePath+'email.html','Popup','toolbar=0,location=1,status=0,menubar=0,scrollbars=1,resizable=1,screenX=10,screenY=10,left=10,top=10,width=480,height=390');}//Open Email This Page Windowfunction openEmailAssessment(thePath) { 	window.open(thePath+'emailAssessment.html','Popup','toolbar=0,location=1,status=0,menubar=0,scrollbars=1,resizable=1,screenX=10,screenY=10,left=10,top=10,width=480,height=390');}