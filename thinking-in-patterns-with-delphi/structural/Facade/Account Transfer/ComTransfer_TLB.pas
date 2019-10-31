unit ComTransfer_TLB;

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
// File generated on 2004-6-23 15:38:17 from Type Library described below.

// ************************************************************************  //
// Type Lib: K:\Delphi模式编程\书稿\结构型模式\Facade\Account Transfer\ComTransferFacade.tlb (1)
// LIBID: {B398A4FB-2ACF-43D6-A22E-B66582A71A8D}
// LCID: 0
// Helpfile: 
// HelpString: ComTransfer Library
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
  ComTransferMajorVersion = 1;
  ComTransferMinorVersion = 0;

  LIBID_ComTransfer: TGUID = '{B398A4FB-2ACF-43D6-A22E-B66582A71A8D}';

  IID_ITransferFacade: TGUID = '{B23A0E1C-E682-472A-8020-9A8B35F75CF2}';
  CLASS_TransferFacade: TGUID = '{A120A275-E67A-4547-908B-592F59591935}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ITransferFacade = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TransferFacade = ITransferFacade;


// *********************************************************************//
// Interface: ITransferFacade
// Flags:     (256) OleAutomation
// GUID:      {B23A0E1C-E682-472A-8020-9A8B35F75CF2}
// *********************************************************************//
  ITransferFacade = interface(IUnknown)
    ['{B23A0E1C-E682-472A-8020-9A8B35F75CF2}']
    procedure CheckBankAccount(PIN: OleVariant; const BankName: WideString; 
                               out AccountID: WideString); stdcall;
    procedure CheckSaving(const AccountID: WideString; Tag: Integer; out Value: Integer); stdcall;
    procedure NewCustomer(out PIN: OleVariant; const Name: WideString; const PSW: WideString); stdcall;
    procedure DoTransfer(amount: Integer; const IDofAccountIn: WideString; 
                         const IDofAccountOut: WideString; out rtnMessage: WideString); stdcall;
  end;

// *********************************************************************//
// The Class CoTransferFacade provides a Create and CreateRemote method to          
// create instances of the default interface ITransferFacade exposed by              
// the CoClass TransferFacade. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTransferFacade = class
    class function Create: ITransferFacade;
    class function CreateRemote(const MachineName: string): ITransferFacade;
  end;

implementation

uses ComObj;

class function CoTransferFacade.Create: ITransferFacade;
begin
  Result := CreateComObject(CLASS_TransferFacade) as ITransferFacade;
end;

class function CoTransferFacade.CreateRemote(const MachineName: string): ITransferFacade;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TransferFacade) as ITransferFacade;
end;

end.
