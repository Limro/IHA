

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 8.00.0595 */
/* at Tue Feb 05 10:49:30 2013
 */
/* Compiler settings for RawComCar.idl:
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

#ifndef __RawComCar_h_h__
#define __RawComCar_h_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ICar_FWD_DEFINED__
#define __ICar_FWD_DEFINED__
typedef interface ICar ICar;

#endif 	/* __ICar_FWD_DEFINED__ */


#ifndef __IRadio_FWD_DEFINED__
#define __IRadio_FWD_DEFINED__
typedef interface IRadio IRadio;

#endif 	/* __IRadio_FWD_DEFINED__ */


#ifndef __ComCar_FWD_DEFINED__
#define __ComCar_FWD_DEFINED__

#ifdef __cplusplus
typedef class ComCar ComCar;
#else
typedef struct ComCar ComCar;
#endif /* __cplusplus */

#endif 	/* __ComCar_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __ICar_INTERFACE_DEFINED__
#define __ICar_INTERFACE_DEFINED__

/* interface ICar */
/* [object][uuid] */ 


EXTERN_C const IID IID_ICar;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("87AC63AE-D8E1-47ba-B752-C422BDED5C45")
    ICar : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE SpeedUp( 
            /* [in] */ long delta) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE CurrentSpeed( 
            /* [retval][out] */ long *currSp) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct ICarVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICar * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICar * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICar * This);
        
        HRESULT ( STDMETHODCALLTYPE *SpeedUp )( 
            ICar * This,
            /* [in] */ long delta);
        
        HRESULT ( STDMETHODCALLTYPE *CurrentSpeed )( 
            ICar * This,
            /* [retval][out] */ long *currSp);
        
        END_INTERFACE
    } ICarVtbl;

    interface ICar
    {
        CONST_VTBL struct ICarVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICar_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ICar_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ICar_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ICar_SpeedUp(This,delta)	\
    ( (This)->lpVtbl -> SpeedUp(This,delta) ) 

#define ICar_CurrentSpeed(This,currSp)	\
    ( (This)->lpVtbl -> CurrentSpeed(This,currSp) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ICar_INTERFACE_DEFINED__ */


#ifndef __IRadio_INTERFACE_DEFINED__
#define __IRadio_INTERFACE_DEFINED__

/* interface IRadio */
/* [object][uuid] */ 


EXTERN_C const IID IID_IRadio;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("06CABBDC-9A08-48e1-B68A-1D192BE4CDE4")
    IRadio : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE CrankTunes( void) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IRadioVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IRadio * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IRadio * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IRadio * This);
        
        HRESULT ( STDMETHODCALLTYPE *CrankTunes )( 
            IRadio * This);
        
        END_INTERFACE
    } IRadioVtbl;

    interface IRadio
    {
        CONST_VTBL struct IRadioVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IRadio_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IRadio_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IRadio_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IRadio_CrankTunes(This)	\
    ( (This)->lpVtbl -> CrankTunes(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IRadio_INTERFACE_DEFINED__ */



#ifndef __RawComCarLib_LIBRARY_DEFINED__
#define __RawComCarLib_LIBRARY_DEFINED__

/* library RawComCarLib */
/* [custom][version][uuid] */ 


EXTERN_C const IID LIBID_RawComCarLib;

EXTERN_C const CLSID CLSID_ComCar;

#ifdef __cplusplus

class DECLSPEC_UUID("9C99478F-21E8-4814-B67B-57DF90846EBD")
ComCar;
#endif
#endif /* __RawComCarLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


