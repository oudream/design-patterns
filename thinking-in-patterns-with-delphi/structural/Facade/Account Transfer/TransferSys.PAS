unit TransferSys;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TAccount = class (TObject)
  private
    function GetSavings: Integer;
    procedure SetSavings(Value: Integer);
  public
    AccountID: string;
    function Validate(UserID:String): Boolean; virtual;
    property Savings: Integer read GetSavings write SetSavings;
  end;
  
  TAccount_In = class (TAccount)
  public
    procedure TransferIn(amount:Int64; UserID:String); override;
  end;
  
  TAccount_Out = class (TAccount)
  public
    procedure TransferOut(amount:Int64;UserID:String); override;
  end;
  
  TBank = class (TObject)
  public
    function CheckAvailableAccounts(UserID:String;BankName:String;
            AccountID:String): Boolean;
  end;
  
  TCustomer = class (TObject)
  private
    FUserId: string;
    Name: string;
    PassWord: string;
    procedure SetUserId(Value: string);
  public
    constructor create(Name:string;UserId:string;Password:string);
    property UserId: string read FUserId write SetUserId;
  end;
  
  TTransaction = class (TObject)
  public
    procedure DBConfige;
    procedure TransferTransaction(amount:Int64; UserID:String);
  end;
  
  TTransfer = class (TObject)
  public
    function CheckBankAccount(UserID:String;BankName:String;AccountID:String): 
            Boolean;
    function CheckSaving(AccountID:String): Int64;
    function DoTransfer(amount:Int64; UserID:String): Boolean;
    procedure NewCustomer(Name:string;UserId:string;Password:string);
  end;
  

procedure Register;

implementation

procedure Register;
begin
end;

{
*********************************** TAccount ***********************************
}
function TAccount.GetSavings: Integer;
begin
end;

procedure TAccount.SetSavings(Value: Integer);
begin
end;

function TAccount.Validate(UserID:String): Boolean;
begin
end;

{
********************************* TAccount_In **********************************
}
procedure TAccount_In.TransferIn(amount:Int64; UserID:String);
begin
end;

{
********************************* TAccount_Out *********************************
}
procedure TAccount_Out.TransferOut(amount:Int64;UserID:String);
begin
end;

{
************************************ TBank *************************************
}
function TBank.CheckAvailableAccounts(UserID:String;BankName:String;
        AccountID:String): Boolean;
begin
end;

{
********************************** TCustomer ***********************************
}
constructor TCustomer.create(Name:string;UserId:string;Password:string);
begin
end;

procedure TCustomer.SetUserId(Value: string);
begin
end;

{
********************************* TTransaction *********************************
}
procedure TTransaction.DBConfige;
begin
end;

procedure TTransaction.TransferTransaction(amount:Int64; UserID:String);
begin
end;

{
********************************** TTransfer ***********************************
}
function TTransfer.CheckBankAccount(UserID:String;BankName:String;
        AccountID:String): Boolean;
begin
end;

function TTransfer.CheckSaving(AccountID:String): Int64;
begin
end;

function TTransfer.DoTransfer(amount:Int64; UserID:String): Boolean;
begin
end;

procedure TTransfer.NewCustomer(Name:string;UserId:string;Password:string);
begin
end;


end.
