unit ComTransaction_TLB;

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
// Type Lib: K:\Delphi模式编程\书稿\结构型模式\Facade\Account Transfer\ComTransfer.tlb (1)
// LIBID: {7359C09A-311E-4D2F-91F6-4D1F1428DA9E}
// LCID: 0
// Helpfile: 
// HelpString: ComTransaction Library
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
  ComTransactionMajorVersion = 1;
  ComTransactionMinorVersion = 0;

  LIBID_ComTransaction: TGUID = '{7359C09A-311E-4D2F-91F6-4D1F1428DA9E}';

  IID_ITransfer: TGUID = '{A30225E4-5885-4AEA-BAA7-DF0F56478DA2}';
  CLASS_Transfer: TGUID = '{C8EEDA21-EFF5-441C-8A98-E1EC6AA87447}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ITransfer = interface;
  ITransferDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Transfer = ITransfer;


// *********************************************************************//
// Interface: ITransfer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A30225E4-5885-4AEA-BAA7-DF0F56478DA2}
// *********************************************************************//
  ITransfer = interface(IDispatch)
    ['{A30225E4-5885-4AEA-BAA7-DF0F56478DA2}']
    function DoTransfer(Amount: Integer; const IDofAccountIn: WideString; 
                        const IDofAccountOut: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  ITransferDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A30225E4-5885-4AEA-BAA7-DF0F56478DA2}
// *********************************************************************//
  ITransferDisp = dispinterface
    ['{A30225E4-5885-4AEA-BAA7-DF0F56478DA2}']
    function DoTransfer(Amount: Integer; const IDofAccountIn: WideString; 
                        const IDofAccountOut: WideString): WideString; dispid 203;
  end;

// *********************************************************************//
// The Class CoTransfer provides a Create and CreateRemote method to          
// create instances of the default interface ITransfer exposed by              
// the CoClass Transfer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTransfer = class
    class function Create: ITransfer;
    class function CreateRemote(const MachineName: string): ITransfer;
  end;

implementation

uses ComObj;

class function CoTransfer.Create: ITransfer;
begin
  Result := CreateComObject(CLASS_Transfer) as ITransfer;
end;

class function CoTransfer.CreateRemote(const MachineName: string): ITransfer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Transfer) as ITransfer;
end;

end.
