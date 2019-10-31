unit ComBank_TLB;

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
// Type Lib: K:\Delphi模式编程\书稿\结构型模式\Facade\Account Transfer\ComBank.tlb (1)
// LIBID: {9B808ACE-C59A-4C26-B059-9B03372F40A9}
// LCID: 0
// Helpfile: 
// HelpString: ComBank Library
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
  ComBankMajorVersion = 1;
  ComBankMinorVersion = 0;

  LIBID_ComBank: TGUID = '{9B808ACE-C59A-4C26-B059-9B03372F40A9}';

  IID_IBank: TGUID = '{C3B8C20E-204F-4DB5-B69E-BFF9386EB745}';
  CLASS_Bank: TGUID = '{A9E501FC-7A10-4D0C-97AE-FC7A4F855CC1}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IBank = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Bank = IBank;


// *********************************************************************//
// Interface: IBank
// Flags:     (256) OleAutomation
// GUID:      {C3B8C20E-204F-4DB5-B69E-BFF9386EB745}
// *********************************************************************//
  IBank = interface(IUnknown)
    ['{C3B8C20E-204F-4DB5-B69E-BFF9386EB745}']
    procedure CheckAvailableAccounts(PIN: OleVariant; const BankName: WideString; 
                                     out AccountID: WideString); stdcall;
  end;

// *********************************************************************//
// The Class CoBank provides a Create and CreateRemote method to          
// create instances of the default interface IBank exposed by              
// the CoClass Bank. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBank = class
    class function Create: IBank;
    class function CreateRemote(const MachineName: string): IBank;
  end;

implementation

uses ComObj;

class function CoBank.Create: IBank;
begin
  Result := CreateComObject(CLASS_Bank) as IBank;
end;

class function CoBank.CreateRemote(const MachineName: string): IBank;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Bank) as IBank;
end;

end.
