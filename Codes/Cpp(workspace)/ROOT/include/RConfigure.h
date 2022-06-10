#ifndef ROOT_RConfigure
#define ROOT_RConfigure

/* Configurations file for macosxarm64 */

/* #undef R__HAVE_CONFIG */

#ifdef R__HAVE_CONFIG
#define ROOTPREFIX    "$(ROOTSYS)"
#define ROOTBINDIR    "$(ROOTSYS)/bin"
#define ROOTLIBDIR    "$(ROOTSYS)/lib"
#define ROOTINCDIR    "$(ROOTSYS)/include"
#define ROOTETCDIR    "$(ROOTSYS)/etc"
#define ROOTDATADIR   "$(ROOTSYS)/."
#define ROOTDOCDIR    "$(ROOTSYS)/."
#define ROOTMACRODIR  "$(ROOTSYS)/macros"
#define ROOTTUTDIR    "$(ROOTSYS)/tutorials"
#define ROOTSRCDIR    "$(ROOTSYS)/src"
#define ROOTICONPATH  "$(ROOTSYS)/icons"
#define TTFFONTDIR    "$(ROOTSYS)/fonts"
#endif

#define EXTRAICONPATH ""

#undef R__HAS_SETRESUID   /**/
#define R__HAS_MATHMORE   /**/
#define R__HAS_PTHREAD    /**/
#undef R__HAS_CUDA    /**/
#undef R__HAS_XFT    /**/
#define R__HAS_COCOA    /**/
#define R__HAS_VC    /**/
#define R__HAS_VDT    /**/
#define R__HAS_VECCORE    /**/
#define R__USE_CXXMODULES   /**/
#define R__USE_LIBCXX    /**/
#define R__HAS_STD_STRING_VIEW   /**/
#undef R__CUDA_HAS_STD_STRING_VIEW   /**/
#undef R__HAS_STD_EXPERIMENTAL_STRING_VIEW   /**/
#undef R__HAS_STOD_STRING_VIEW /**/
#define R__HAS_OP_EQUAL_PLUS_STRING_VIEW /**/
#define R__HAS_STD_APPLY /**/
#define R__HAS_STD_INVOKE /**/
#define R__HAS_STD_INDEX_SEQUENCE /**/
#define R__HAS_ATTRIBUTE_ALWAYS_INLINE /**/
#define R__HAS_ATTRIBUTE_NOINLINE /**/
#undef R__HAS_HARDWARE_INTERFERENCE_SIZE /**/
#define R__USE_IMT   /**/
#undef R__COMPLETE_MEM_TERMINATION /**/
#undef R__HAS_CEFWEB  /**/
#undef R__HAS_QT5WEB  /**/
#define R__HAS_DAVIX  /**/
#define R__HAS_DATAFRAME /**/
#undef R__LESS_INCLUDES /**/
#define R__HAS_TBB /**/
#undef R__HAS_ROOFIT_MULTIPROCESS /**/

#if defined(R__HAS_VECCORE) && defined(R__HAS_VC)
#ifndef VECCORE_ENABLE_VC
#define VECCORE_ENABLE_VC
#endif
#endif

#undef R__HAS_DEFAULT_LZ4  /**/
#define R__HAS_DEFAULT_ZLIB  /**/
#undef R__HAS_DEFAULT_LZMA  /**/
#undef R__HAS_DEFAULT_ZSTD  /**/
#undef R__HAS_CLOUDFLARE_ZLIB /**/

#define R__HAS_TMVACPU /**/
#undef R__HAS_TMVAGPU /**/
#undef R__HAS_CUDNN /**/
#define R__HAS_PYMVA /**/
#undef R__HAS_RMVA /**/

#undef R__HAS_URING /**/

#endif
