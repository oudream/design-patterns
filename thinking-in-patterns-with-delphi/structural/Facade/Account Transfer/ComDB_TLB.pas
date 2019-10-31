unit ComDB_TLB;

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
// File generated on 2004-6-23 15:38:15 from Type Library described below.

// ************************************************************************  //
// Type Lib: K:\Delphi模式编程\书稿\结构型模式\Facade\Account Transfer\ComDB.tlb (1)
// LIBID: {84316440-93E0-476C-BE99-EE5FBAFDA755}
// LCID: 0
// Helpfile: 
// HelpString: ComDB Library
// DepndLst: 
//   (1) v1.0 Midas, (E:\WINDOWS\System32\midas.dll)
//   (2) v2.0 stdole, (E:\WINDOWS\System32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ComDBMajorVersion = 1;
  ComDBMinorVersion = 0;

  LIBID_ComDB: TGUID = '{84316440-93E0-476C-BE99-EE5FBAFDA755}';

  IID_IRDB: TGUID = '{DCCA9EEB-BC51-4942-81EF-1F40512AD2E2}';
  CLASS_RDB: TGUID = '{E1201DBD-D963-4F50-8E6E-9457B5BA0F77}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRDB = interface;
  IRDBDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RDB = IRDB;


// *********************************************************************//
// Interface: IRDB
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DCCA9EEB-BC51-4942-81EF-1F40512AD2E2}
// *********************************************************************//
  IRDB = interface(IAppServer)
    ['{DCCA9EEB-BC51-4942-81EF-1F40512AD2E2}']
    function qryAccount(const BankName: WideString): WideString; safecall;
    function qryBalance(const AccountID: WideString): Integer; safecall;
    function TransferUpdate(Savings: Integer; const AccountID: WideString): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRDBDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DCCA9EEB-BC51-4942-81EF-1F40512AD2E2}
// *********************************************************************//
  IRDBDisp = dispinterface
    ['{DCCA9EEB-BC51-4942-81EF-1F40512AD2E2}']
    function qryAccount(const BankName: WideString): WideString; dispid 301;
    function qryBalance(const AccountID: WideString): Integer; dispid 302;
    function TransferUpdate(Savings: Integer; const AccountID: WideString): Integer; dispid 303;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoRDB provides a Create and CreateRemote method to          
// create instances of the default interface IRDB exposed by              
// the CoClass RDB. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDB = class
    class function Create: IRDB;
    class function CreateRemote(const MachineName: string): IRDB;
  end;

implementation

uses ComObj;

class function CoRDB.Create: IRDB;
begin
  Result := CreateComObject(CLASS_RDB) as IRDB;
end;

class function CoRDB.CreateRemote(const MachineName: string): IRDB;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDB) as IRDB;
end;

end.
