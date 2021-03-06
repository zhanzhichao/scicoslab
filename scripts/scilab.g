#!/bin/SCILABGS
# Warning : some old versions of sh dont allow inline function definitions
# like do_scilex()... . In this case use a system V sh (sh5)

# Copyright INRIA

#############################################################################
#                                                                           #
#                       DO NOT MODIFY BELOW THIS LINE                       #
#                                                                           #
#############################################################################

SCI="SCILAB_DIRECTORY"
export SCI

if test "$DISPLAY" = ""; then
  DISPLAY="unix:0.0"
fi
export DISPLAY

if test "$PVM_ROOT" = ""; then
  PVM_ROOT="$SCI/pvm3"
fi
export PVM_ROOT

if test "$PVM_ARCH" = ""; then
  PVM_ARCH=`$PVM_ROOT/lib/pvmgetarch`
fi
export PVM_ARCH

if test "$LD_LIBRARY_PATH" = ""; then
	LD_LIBRARY_PATH=$SCI/bin:$SCI/libs
else
	LD_LIBRARY_PATH=$SCI/bin:$SCI/libs:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

if test "$SHLIB_PATH" = ""; then
	SHLIB_PATH=$SCI/bin:$SCI/libs
else
	SHLIB_PATH=$SCI/bin:$SCI/libs:$SHLIB_PATH
fi
export SHLIB_PATH

#TCL_LIBRARY

#TK_LIBRARY

do_scilex()
{
    PATH=$PATH:$SCI:$SCI/util
    export PATH

    XAPPLRESDIR=$SCI/X11_defaults
    export XAPPLRESDIR

    tty -s && stty kill '^U' intr '^C' erase '^H' quit '^\' eof '^D' susp '^Z'
    $SCI/bin/scilex $* 
}

do_scilex_now()
{
    PATH=$PATH:$SCI:$SCI/util
    export PATH

    XAPPLRESDIR=$SCI/X11_defaults
    export XAPPLRESDIR

    $SCI/bin/scilex $* 
}

do_help()
{
echo "Usage:"
echo     "scilab <options>"
echo     " "
echo     "      Possible options are:"
echo     "      -args Arguments : passes Arguments to Scilab, This Arguments can be retreived"
echo     "                        by the Scilab function sciargs."
echo     "      -display Display: for use under Xwindow systems to set a specific X server display."
echo     "      -d Display      : equivalent to display Display."
echo     "      -debug          : Start Scilab under gdb (Unix/linux only)."
echo     "      -e Instruction  : execute the scilab instruction given in Instruction argument."
echo     "                        -e and -f options are mutually exclusive."
echo     "      -f File         : execute the scilab script given in File argument."
echo     "                        -e and -f options are mutually exclusive."
echo     "      -l Lang         : set the current language. Lang can be equal to fr or eng."
echo     "      -link <objects> : Is used under Unix/linux to produce a local executable code of Scilab"
echo     "                        linked with the additional files given by the user in  <objects>."
echo     "                        the -link option should be used without any other option."
echo     "      -mem N          : set the initial stacksize, for use with -ns option."
echo     "      -nb             : do not display the Scilab banner at starting time."
echo     "      -ns             : do not execute scilab.star startup file."
echo     "      -nouserstartup  : do not execute the user startup files SCIHOME/.scilab or SCIHOME/scilab.ini."
echo     "      -nw             : start Scilab without specialized Scilab Window."
echo     "      -nwni           : start Scilab without user interaction (batch mode)."
echo     "      -nogui          : start Scilab without user GUI (batch mode)."
echo     "      --texmacs       : reserved for TeXMacs."
exit
}

do_compile()
{
	umask 002
	rm -f report
	name=`basename $1 .sci`
	echo generating $name.bin
	echo "predef();getf('$name.sci');save('$name.bin');quit"\
	      | $SCI/bin/scilex -ns -nw | sed 1,8d 1>report 2>&1
	if (grep error report 1> /dev/null  2>&1);
	then cat report;echo " " 
	   echo see `pwd`/report for more informations
	   grep libok report>/dev/null; 
	else rm -f report;
	fi
	umask 022
	exit 0
}

do_lib()
{
	umask 002
	rm -f report
	echo "$1=lib('$2/');save('$2/lib',$1);quit"\
	      | $SCI/bin/scilex -ns -nw |sed 1,/--\>/d 1>report 2>&1
	if (grep error report 1> /dev/null  2>&1);
	then cat report;echo " " 
		echo see `pwd`/report for more informations
		grep libok report>/dev/null; 
	else rm -f report;
	fi
	umask 022
	exit 0
}


do_print() 
{
	$SCI/bin/BEpsf $1 $2 
	lpr -P$3 $2.eps
	rm -f $2 $2.eps
}

do_save() 
{
	case $3 in 
          Postscript)
		
                wantedName=$2.eps #add a .eps because BEpsf will do it wrong
                mv $2 $wantedName
                
                $SCI/bin/BEpsf $1 $wantedName
                rm -f $wantedName.temp 1> /dev/null  2>&1
                ;;
          Postscript-Latex)

                wantedEpsName=$2.eps
                newEps=$(echo $2 | cut -d . -f1).eps
                # move the file in case BEpsf will destroy it
                mv $newEps $newEps.scilab.temp 1> /dev/null  2>&1

                wantedTexName=$2.tex
                newTex=$(echo $2 | cut -d . -f1).tex # get the name created by Blatexpr
                # move the file in case BEpsf will destroy it
                mv $newTex $newTex.scilab.temp 1> /dev/null  2>&1

		$SCI/bin/Blatexpr $1 1.0 1.0 $2
                
                if test $newEps != $wantedEpsName ; then
                        mv $newEps $wantedEpsName
                        mv $newEps.scilab.temp $newEps 1> /dev/null  2>&1 #move the temp file back
                fi

                
                if test $newTex != $wantedTexName ; then
                        mv $newTex $wantedTexName
                        mv $newTex.scilab.temp $newTex 1> /dev/null  2>&1 #move the temp file back
                fi
	   	;;
	  Xfig)
		case $1 in
		-portrait)
		        mv $2 $2.fig
		;;
		-landscape)
		        sed -e "2s/Portrait/Landscape/" $2 >$2.fig
			rm -f $2
                ;;
		esac
           	;;
          Gif)
		case $1 in
		-portrait)
		        mv $2 $2.gif
		;;
		-landscape)
			mv $2 $2.gif
		;;
		esac
           	;;
	   PPM)
		case $1 in
		-portrait)
			mv $2 $2.ppm
		;;
		-landscape)
			mv $2 $2.ppm
		;;
		esac
           	;;
	esac
}

# calling Scilab with no argument or special cases of calling Scilab
rest="no"
case $# in
    0)
	do_scilex &
        ;;
    2)
        case $1 in
            -comp)
		do_compile $2
                ;;
            -link)
                shift
		$SCI/bin/scilink $SCI $*
                ;;
            -function)
		$SCI/bin/minfopr $SCI $2
		;;
            *)
		rest="yes"
                ;;
        esac
        ;;
    3)
        case $1 in
            -lib)
		do_lib $2 $3
                ;;
            -print_l)
                do_print -landscape $2 $3
                ;;
            -print_p)
                do_print -portrait $2 $3
                ;;
            -save_l)
                do_save -landscape $2 $3
                ;;
            -save_p)
                do_save -portrait $2 $3
                ;;
            -link)
                shift
		$SCI/bin/scilink $SCI $*
                ;;
            *)
		rest="yes"
                ;;
        esac
        ;;
    *)
        case $1 in
            -link)
                shift
		$SCI/bin/scilink $SCI $*
                ;;
            *)
		rest="yes"
                ;;
        esac
        ;;
esac

# really calling Scilab with arguments

sci_args=

if test "$rest" = "yes"; then

  debug=
  now=
  display=
  start_file=
  prevarg=
  language=
  fontname=
  for sciarg 
  do
    # If the previous argument needs an argument, assign it.
    if test -n "$prevarg"; then
      eval "$prevarg=\$sciarg"
      prevarg=
      continue
    fi
    case $sciarg in
      -nogui)
	  sci_args="$sci_args -nogui"
          ;;
      -ns)
	  sci_args="$sci_args -ns"
          ;;
      -nb)
	  sci_args="$sci_args -nb"
          ;;
      -debug) 
          debug="-debug"
          ;;
      -nw)
          now="-nw"
	  sci_args="$sci_args -nw"
          ;;
      --texmacs)
          now="-nw"
          sci_args="$sci_args -nw --texmacs"
          ;;
      -nwni)
          now="-nw"
	  sci_args="$sci_args -nw"
          ;;
      -display|-d)
          prevarg="display"
          ;;
       -f)
          prevarg="start_file"
          ;;
       -l)
          prevarg="language"
          ;;
       -e)
          prevarg="start_exp"
          ;;
       -args)
           prevarg="arguments"
          ;;
       -mem)
           prevarg="mem"
          ;;
      *)
          do_help
          ;;
    esac
  done

  if test -n "$display"; then
    sci_args="$sci_args -display $display"
  fi

  if test -n "$start_file"; then
    sci_args="$sci_args -f $start_file"
  fi

  if test -n "$start_exp"; then
    sci_args="$sci_args -e $start_exp"
  fi

  if test -n "$language"; then
    sci_args="$sci_args -l $language"
  fi

  if test -n "$arguments"; then
    sci_args="$sci_args  $arguments"
  fi
  if test -n "$mem"; then
    sci_args="$sci_args -mem  $mem"
  fi
  if test -n "$debug"; then
     gdb  $SCI/bin/scilex $sci_args
  else
    if test -n "$now"; then
        sci_exe="do_scilex_now"
        $sci_exe $sci_args
    else
        sci_exe="do_scilex"
        $sci_exe $sci_args 
    fi
  fi
fi

