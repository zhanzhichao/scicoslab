// generated by builder.sce: Please do not edit this file
// ------------------------------------------------------
libmex_path=get_file_path('loader.sce');
link(libmex_path+'/lib/libutil.dll');
functions=[ 'f1';
            'f2';
            'f3';
            'f4';
];
addinter(libmex_path+'/libmex.dll','libmex',functions);
