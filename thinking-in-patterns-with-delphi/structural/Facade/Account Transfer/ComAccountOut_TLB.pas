unit ComAccountOut_TLB;

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
// Type Lib: K:\Delphi模式编程\书稿\结构型模式\Facade\Account Transfer\ComAccountOut.tlb (1)
// LIBID: {A8EF0656-64DE-4209-9F35-5773D3E7072B}
// LCID: 0
// Helpfile: 
// HelpString: ComAccountOut Library
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
  ComAccountOutMajorVersion = 1;
  ComAccountOutMinorVersion = 0;

  LIBID_ComAccountOut: TGUID = '{A8EF0656-64DE-4209-9F35-5773D3E7072B}';

  IID_IAccountOut: TGUID = '{7B0DEBED-BCD9-4415-B6D7-CFC46DED89CC}';
  CLASS_AccountOut: TGUID = '{441A3725-4BCB-4EDF-B72F-DC34950350C4}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAccountOut = interface;
  IAccountOutDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AccountOut = IAccountOut;


// *********************************************************************//
// Interface: IAccountOut
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7B0DEBED-BCD9-4415-B6D7-CFC46DED89CC}
// *********************************************************************//
  IAccountOut = interface(IDispatch)
    ['{7B0DEBED-BCD9-4415-B6D7-CFC46DED89CC}']
    procedure TransferOut(Amount: Integer; const AccountID: WideString); safecall;
    function GetSavings(const AccountID: WideString): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAccountOutDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7B0DEBED-BCD9-4415-B6D7-CFC46DED89CC}
// *********************************************************************//
  IAccountOutDisp = dispinterface
    ['{7B0DEBED-BCD9-4415-B6D7-CFC46DED89CC}']
    procedure TransferOut(Amount: Integer; const AccountID: WideString); dispid 201;
    function GetSavings(const AccountID: WideString): Integer; dispid 202;
  end;

// *********************************************************************//
// The Class CoAccountOut provides a Create and CreateRemote method to          
// create instances of the default interface IAccountOut exposed by              
// the CoClass AccountOut. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAccountOut = class
    class function Create: IAccountOut;
    class function CreateRemote(const MachineName: string): IAccountOut;
  end;

implementation

uses ComObj;

class function CoAccountOut.Create: IAccountOut;
begin
  Result := CreateComObject(CLASS_AccountOut) as IAccountOut;
end;

class function CoAccountOut.CreateRemote(const MachineName: string): IAccountOut;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AccountOut) as IAccountOut;
end;

end.
