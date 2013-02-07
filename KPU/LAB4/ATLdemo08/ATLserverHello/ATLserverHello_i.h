

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 8.00.0595 */
/* at Thu Feb 07 17:42:36 2013
 */
/* Compiler settings for ATLserverHello.idl:
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

#ifndef __ATLserverHello_i_h__
#define __ATLserverHello_i_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IATLHelloServer_FWD_DEFINED__
#define __IATLHelloServer_FWD_DEFINED__
typedef interface IATLHelloServer IATLHelloServer;

#endif 	/* __IATLHelloServer_FWD_DEFINED__ */


#ifndef __ATLHelloServer_FWD_DEFINED__
#define __ATLHelloServer_FWD_DEFINED__

#ifdef __cplusplus
typedef class ATLHelloServer ATLHelloServer;
#else
typedef struct ATLHelloServer ATLHelloServer;
#endif /* __cplusplus */

#endif 	/* __ATLHelloServer_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IATLHelloServer_INTERFACE_DEFINED__
#define __IATLHelloServer_INTERFACE_DEFINED__

/* interface IATLHelloServer */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IATLHelloServer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("43BBAF03-BB8B-41EB-8C46-CF3CB9A08B78")
    IATLHelloServer : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Hello( 
            /* [in] */ CHAR *arg) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IATLHelloServerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IATLHelloServer * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IATLHelloServer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IATLHelloServer * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IATLHelloServer * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IATLHelloServer * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IATLHelloServer * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IATLHelloServer * This,
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
            IATLHelloServer * This,
            /* [in] */ CHAR *arg);
        
        END_INTERFACE
    } IATLHelloServerVtbl;

    interface IATLHelloServer
    {
        CONST_VTBL struct IATLHelloServerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IATLHelloServer_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IATLHelloServer_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IATLHelloServer_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IATLHelloServer_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IATLHelloServer_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IATLHelloServer_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IATLHelloServer_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IATLHelloServer_Hello(This,arg)	\
    ( (This)->lpVtbl -> Hello(This,arg) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IATLHelloServer_INTERFACE_DEFINED__ */



#ifndef __ATLserverHelloLib_LIBRARY_DEFINED__
#define __ATLserverHelloLib_LIBRARY_DEFINED__

/* library ATLserverHelloLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_ATLserverHelloLib;

EXTERN_C const CLSID CLSID_ATLHelloServer;

#ifdef __cplusplus

class DECLSPEC_UUID("3F54C640-E0B7-4192-B86C-6ABA767BB07B")
ATLHelloServer;
#endif
#endif /* __ATLserverHelloLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


