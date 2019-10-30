unit ComCustomer_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2004-6-23 15:38:18 from Type Library described below.

// ************************************************************************  //
// Type Lib: K:\Delphi模式编程\书稿\结构型模式\Facade\Account Transfer\ComCustomer.tlb (1)
// LIBID: {845EE3D7-B1EA-4FF6-95BA-6F3B45B576EA}
// LCID: 0
// Helpfile: 
// HelpString: ComCustomer Library
// DepndLst: 
//   (1) v2.0 stdole, (E:\WINDOWS\System32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ComCustomerMajorVersion = 1;
  ComCustomerMinorVersion = 0;

  LIBID_ComCustomer: TGUID = '{845EE3D7-B1EA-4FF6-95BA-6F3B45B576EA}';

  IID_ICustomer: TGUID = '{2AFDA654-5CD6-4AFA-9EB6-163BCDC75C9A}';
  CLASS_Customer: TGUID = '{AABF18CC-8AC9-4D73-A711-67795EEA03E8}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICustomer = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Customer = ICustomer;


// *********************************************************************//
// Interface: ICustomer
// Flags:     (256) OleAutomation
// GUID:      {2AFDA654-5CD6-4AFA-9EB6-163BCDC75C9A}
// *********************************************************************//
  ICustomer = interface(IUnknown)
    ['{2AFDA654-5CD6-4AFA-9EB6-163BCDC75C9A}']
    procedure create(out PIN: OleVariant; const Name: WideString; const PSW: WideString); stdcall;
  end;

// *********************************************************************//
// The Class CoCustomer provides a Create and CreateRemote method to          
// create instances of the default interface ICustomer exposed by              
// the CoClass Customer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCustomer = class
    class function Create: ICustomer;
    class function CreateRemote(const MachineName: string): ICustomer;
  end;

implementation

uses ComObj;

class function CoCustomer.Create: ICustomer;
begin
  Result := CreateComObject(CLASS_Customer) as ICustomer;
end;

class function CoCustomer.CreateRemote(const MachineName: string): ICustomer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Customer) as ICustomer;
end;

end.
