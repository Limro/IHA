

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 8.00.0595 */
/* at Thu Feb 07 17:42:36 2013
 */
/* Compiler settings for ATLBetterHello.idl:
    Oicf, W1, Zp8, env=Win32 (32b run), target_arch=X86 8.00.0595 
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
/* @@MIDL_FILE_HEADING(  ) */

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 475
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __ATLBetterHello_i_h__
#define __ATLBetterHello_i_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IBetterHello_FWD_DEFINED__
#define __IBetterHello_FWD_DEFINED__
typedef interface IBetterHello IBetterHello;

#endif 	/* __IBetterHello_FWD_DEFINED__ */


#ifndef __BetterHello_FWD_DEFINED__
#define __BetterHello_FWD_DEFINED__

#ifdef __cplusplus
typedef class BetterHello BetterHello;
#else
typedef struct BetterHello BetterHello;
#endif /* __cplusplus */

#endif 	/* __BetterHello_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IBetterHello_INTERFACE_DEFINED__
#define __IBetterHello_INTERFACE_DEFINED__

/* interface IBetterHello */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IBetterHello;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("604DF214-04D1-4EE3-8B15-01C72AA99B89")
    IBetterHello : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Hello( 
            /* [in] */ BSTR arg) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IBetterHelloVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IBetterHello * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IBetterHello * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IBetterHello * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IBetterHello * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IBetterHello * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IBetterHello * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IBetterHello * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Hello )( 
            IBetterHello * This,
            /* [in] */ BSTR arg);
        
        END_INTERFACE
    } IBetterHelloVtbl;

    interface IBetterHello
    {
        CONST_VTBL struct IBetterHelloVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBetterHello_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBetterHello_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBetterHello_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IBetterHello_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IBetterHello_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IBetterHello_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IBetterHello_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IBetterHello_Hello(This,arg)	\
    ( (This)->lpVtbl -> Hello(This,arg) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBetterHello_INTERFACE_DEFINED__ */



#ifndef __ATLBetterHelloLib_LIBRARY_DEFINED__
#define __ATLBetterHelloLib_LIBRARY_DEFINED__

/* library ATLBetterHelloLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_ATLBetterHelloLib;

EXTERN_C const CLSID CLSID_BetterHello;

#ifdef __cplusplus

class DECLSPEC_UUID("8BAC91C1-E27C-4A28-947F-102109DD1524")
BetterHello;
#endif
#endif /* __ATLBetterHelloLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long *, unsigned long            , BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  unsigned long *, unsigned char *, BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(unsigned long *, unsigned char *, BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long *, BSTR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


