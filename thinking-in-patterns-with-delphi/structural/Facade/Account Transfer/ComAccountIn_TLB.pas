unit ComAccountIn_TLB;

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
// File generated on 2004-6-23 15:38:19 from Type Library described below.

// ************************************************************************  //
// Type Lib: K:\Delphi模式编程\书稿\结构型模式\Facade\Account Transfer\ComAccountIn.tlb (1)
// LIBID: {94A62A56-DC35-4FC5-8EF9-593C49CEDF71}
// LCID: 0
// Helpfile: 
// HelpString: ComAccountIn Library
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
  ComAccountInMajorVersion = 1;
  ComAccountInMinorVersion = 0;

  LIBID_ComAccountIn: TGUID = '{94A62A56-DC35-4FC5-8EF9-593C49CEDF71}';

  IID_IAccountIn: TGUID = '{B5BD4750-D14A-4537-8629-2A95FDA197A5}';
  CLASS_AccountIn: TGUID = '{31AA55D1-B855-496E-B861-E5DE7490C917}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAccountIn = interface;
  IAccountInDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AccountIn = IAccountIn;


// *********************************************************************//
// Interface: IAccountIn
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B5BD4750-D14A-4537-8629-2A95FDA197A5}
// *********************************************************************//
  IAccountIn = interface(IDispatch)
    ['{B5BD4750-D14A-4537-8629-2A95FDA197A5}']
    procedure TransferIn(Amount: Integer; const AccountID: WideString); safecall;
    function GetSavings(const AccountID: WideString): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAccountInDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B5BD4750-D14A-4537-8629-2A95FDA197A5}
// *********************************************************************//
  IAccountInDisp = dispinterface
    ['{B5BD4750-D14A-4537-8629-2A95FDA197A5}']
    procedure TransferIn(Amount: Integer; const AccountID: WideString); dispid 201;
    function GetSavings(const AccountID: WideString): Integer; dispid 202;
  end;

// *********************************************************************//
// The Class CoAccountIn provides a Create and CreateRemote method to          
// create instances of the default interface IAccountIn exposed by              
// the CoClass AccountIn. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAccountIn = class
    class function Create: IAccountIn;
    class function CreateRemote(const MachineName: string): IAccountIn;
  end;

implementation

uses ComObj;

class function CoAccountIn.Create: IAccountIn;
begin
  Result := CreateComObject(CLASS_AccountIn) as IAccountIn;
end;

class function CoAccountIn.CreateRemote(const MachineName: string): IAccountIn;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AccountIn) as IAccountIn;
end;

end.
