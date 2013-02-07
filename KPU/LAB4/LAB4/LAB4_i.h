

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 8.00.0595 */
/* at Thu Feb 07 19:26:51 2013
 */
/* Compiler settings for LAB4.idl:
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

#ifndef __LAB4_i_h__
#define __LAB4_i_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IMath2_FWD_DEFINED__
#define __IMath2_FWD_DEFINED__
typedef interface IMath2 IMath2;

#endif 	/* __IMath2_FWD_DEFINED__ */


#ifndef __IAdvMath_FWD_DEFINED__
#define __IAdvMath_FWD_DEFINED__
typedef interface IAdvMath IAdvMath;

#endif 	/* __IAdvMath_FWD_DEFINED__ */


#ifndef __Math2_FWD_DEFINED__
#define __Math2_FWD_DEFINED__

#ifdef __cplusplus
typedef class Math2 Math2;
#else
typedef struct Math2 Math2;
#endif /* __cplusplus */

#endif 	/* __Math2_FWD_DEFINED__ */


#ifndef __AdvMath_FWD_DEFINED__
#define __AdvMath_FWD_DEFINED__

#ifdef __cplusplus
typedef class AdvMath AdvMath;
#else
typedef struct AdvMath AdvMath;
#endif /* __cplusplus */

#endif 	/* __AdvMath_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IMath2_INTERFACE_DEFINED__
#define __IMath2_INTERFACE_DEFINED__

/* interface IMath2 */
/* [unique][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IMath2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("DE77138F-DEE8-466B-BAD2-07A78E44D77D")
    IMath2 : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Add( 
            /* [in] */ DOUBLE firstNumber,
            /* [in] */ DOUBLE secondNumber,
            /* [retval][out] */ DOUBLE *retvalue) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sub( 
            /* [in] */ DOUBLE first,
            /* [in] */ DOUBLE second,
            /* [retval][out] */ DOUBLE *retValue) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Offset( 
            /* [retval][out] */ DOUBLE *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Offset( 
            /* [in] */ DOUBLE newVal) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IMath2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMath2 * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMath2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMath2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IMath2 * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IMath2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IMath2 * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IMath2 * This,
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
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            IMath2 * This,
            /* [in] */ DOUBLE firstNumber,
            /* [in] */ DOUBLE secondNumber,
            /* [retval][out] */ DOUBLE *retvalue);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sub )( 
            IMath2 * This,
            /* [in] */ DOUBLE first,
            /* [in] */ DOUBLE second,
            /* [retval][out] */ DOUBLE *retValue);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Offset )( 
            IMath2 * This,
            /* [retval][out] */ DOUBLE *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Offset )( 
            IMath2 * This,
            /* [in] */ DOUBLE newVal);
        
        END_INTERFACE
    } IMath2Vtbl;

    interface IMath2
    {
        CONST_VTBL struct IMath2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMath2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMath2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMath2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMath2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IMath2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IMath2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IMath2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IMath2_Add(This,firstNumber,secondNumber,retvalue)	\
    ( (This)->lpVtbl -> Add(This,firstNumber,secondNumber,retvalue) ) 

#define IMath2_Sub(This,first,second,retValue)	\
    ( (This)->lpVtbl -> Sub(This,first,second,retValue) ) 

#define IMath2_get_Offset(This,pVal)	\
    ( (This)->lpVtbl -> get_Offset(This,pVal) ) 

#define IMath2_put_Offset(This,newVal)	\
    ( (This)->lpVtbl -> put_Offset(This,newVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMath2_INTERFACE_DEFINED__ */


#ifndef __IAdvMath_INTERFACE_DEFINED__
#define __IAdvMath_INTERFACE_DEFINED__

/* interface IAdvMath */
/* [unique][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IAdvMath;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6123FAAC-F583-40E0-BCBE-63A869C45D29")
    IAdvMath : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Multiply( 
            /* [in] */ DOUBLE first,
            /* [in] */ DOUBLE second,
            /* [retval][out] */ DOUBLE *retValue) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Diversion( 
            /* [in] */ DOUBLE first,
            /* [in] */ DOUBLE second,
            /* [retval][out] */ DOUBLE *retValue) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IAdvMathVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAdvMath * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAdvMath * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAdvMath * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IAdvMath * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IAdvMath * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IAdvMath * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IAdvMath * This,
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
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Multiply )( 
            IAdvMath * This,
            /* [in] */ DOUBLE first,
            /* [in] */ DOUBLE second,
            /* [retval][out] */ DOUBLE *retValue);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Diversion )( 
            IAdvMath * This,
            /* [in] */ DOUBLE first,
            /* [in] */ DOUBLE second,
            /* [retval][out] */ DOUBLE *retValue);
        
        END_INTERFACE
    } IAdvMathVtbl;

    interface IAdvMath
    {
        CONST_VTBL struct IAdvMathVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAdvMath_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAdvMath_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAdvMath_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAdvMath_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IAdvMath_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IAdvMath_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IAdvMath_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IAdvMath_Multiply(This,first,second,retValue)	\
    ( (This)->lpVtbl -> Multiply(This,first,second,retValue) ) 

#define IAdvMath_Diversion(This,first,second,retValue)	\
    ( (This)->lpVtbl -> Diversion(This,first,second,retValue) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAdvMath_INTERFACE_DEFINED__ */



#ifndef __LAB4Lib_LIBRARY_DEFINED__
#define __LAB4Lib_LIBRARY_DEFINED__

/* library LAB4Lib */
/* [version][uuid] */ 


EXTERN_C const IID LIBID_LAB4Lib;

EXTERN_C const CLSID CLSID_Math2;

#ifdef __cplusplus

class DECLSPEC_UUID("FB23BCAB-9120-4114-A3AA-890695B3C565")
Math2;
#endif

EXTERN_C const CLSID CLSID_AdvMath;

#ifdef __cplusplus

class DECLSPEC_UUID("81379DF2-E797-420A-A79E-C971EC65717A")
AdvMath;
#endif
#endif /* __LAB4Lib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


