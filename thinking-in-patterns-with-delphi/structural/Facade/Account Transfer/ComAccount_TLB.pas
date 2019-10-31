unit ComAccount_TLB;

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
// File generated on 2004-2-3 21:27:45 from Type Library described below.

// ************************************************************************  //
// Type Lib: F:\Delphi与模式\书稿\Facade\Account Transfer\ComAccount.tlb (1)
// LIBID: {8EE9664D-0226-49DE-AC8B-89853C62F2F5}
// LCID: 0
// Helpfile: 
// HelpString: ComAccount Library
// DepndLst: 
//   (1) v2.0 stdole, (F:\WINNT\system32\stdole2.tlb)
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
  ComAccountMajorVersion = 1;
  ComAccountMinorVersion = 0;

  LIBID_ComAccount: TGUID = '{8EE9664D-0226-49DE-AC8B-89853C62F2F5}';

  IID_IAccount: TGUID = '{72218899-B1AB-47C0-99CC-30D07720643B}';
  CLASS_Account: TGUID = '{BADF8E2B-F971-4EB6-9C9B-0D615669B84A}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAccount = interface;
  IAccountDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Account = IAccount;


// *********************************************************************//
// Interface: IAccount
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {72218899-B1AB-47C0-99CC-30D07720643B}
// *********************************************************************//
  IAccount = interface(IDispatch)
    ['{72218899-B1AB-47C0-99CC-30D07720643B}']
    procedure TransferIn(Amount: Int64; const AccountID: WideString); safecall;
    procedure TransferOut(Amount: Int64; const AccountID: WideString); safecall;
    procedure GetSavings(const AccountID: WideString; out Amount: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IAccountDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {72218899-B1AB-47C0-99CC-30D07720643B}
// *********************************************************************//
  IAccountDisp = dispinterface
    ['{72218899-B1AB-47C0-99CC-30D07720643B}']
    procedure TransferIn(Amount: {??Int64}OleVariant; const AccountID: WideString); dispid 201;
    procedure TransferOut(Amount: {??Int64}OleVariant; const AccountID: WideString); dispid 202;
    procedure GetSavings(const AccountID: WideString; out Amount: OleVariant); dispid 203;
  end;

// *********************************************************************//
// The Class CoAccount provides a Create and CreateRemote method to          
// create instances of the default interface IAccount exposed by              
// the CoClass Account. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAccount = class
    class function Create: IAccount;
    class function CreateRemote(const MachineName: string): IAccount;
  end;

implementation

uses ComObj;

class function CoAccount.Create: IAccount;
begin
  Result := CreateComObject(CLASS_Account) as IAccount;
end;

class function CoAccount.CreateRemote(const MachineName: string): IAccount;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Account) as IAccount;
end;

end.
