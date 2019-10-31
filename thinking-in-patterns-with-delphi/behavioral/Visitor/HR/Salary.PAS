unit Salary;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TVisitor = class;
  TElement = class (TObject)
  public
    procedure Accept(visitor:TVisitor); virtual; abstract;
  end;

  TConcreteElementA = class (TElement)
  public
    procedure Accept(visitor:TVisitor); override;
    procedure OperationA;
  end;
  
  TConcreteElementB = class (TElement)
  public
    procedure Accept(visitor:TVisitor); override;
    procedure OperationB;
  end;
  
  TObjectStructure = class (TObject)
  private
    FElements: TList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Accept(visitor:TVisitor );
    procedure Attach(element:TElement);
    procedure Detach(element:TElement);
  end;

  TVisitor = class (TObject)
  public
    procedure VisitConcreteElementA(ConcreteElementA:TConcreteElementA); 
            virtual; abstract;
    procedure VisitConcreteElementB(ConcreteElementB:TConcreteElementB); 
            virtual; abstract;
  end;

  TConcreteVisitor1 = class (TVisitor)
  public
    procedure VisitConcreteElementA(ConcreteElementA:TConcreteElementA); 
            override;
    procedure VisitConcreteElementB(ConcreteElementB:TConcreteElementB); 
            override;
  end;
  
  TConcreteVisitor2 = class (TVisitor)
  public
    procedure VisitConcreteElementA(ConcreteElementA:TConcreteElementA); 
            override;
    procedure VisitConcreteElementB(ConcreteElementB:TConcreteElementB); 
            override;
  end;
  



implementation



{
****************************** TConcreteElementA *******************************
}
procedure TConcreteElementA.Accept(visitor:TVisitor);
begin
  visitor.VisitConcreteElementA(self);
end;

procedure TConcreteElementA.OperationA;
begin
//������дConcreteElementA�Ĳ�������
  showmessage('ִ��ConcreteElementA�Ĳ���');
end;

{
****************************** TConcreteElementB *******************************
}
procedure TConcreteElementB.Accept(visitor:TVisitor);
begin
  visitor.VisitConcreteElementB(self);
end;

procedure TConcreteElementB.OperationB;
begin
//������дConcreteElementB�Ĳ�������
  showmessage('ִ��ConcreteElementB�Ĳ���');
end;

{
******************************* TObjectStructure *******************************
}
constructor TObjectStructure.Create;
begin
  FElements:=TList.Create ;
end;

destructor TObjectStructure.Destroy;
var
  i:integer;
begin
  for i :=0  to FElements.Count-1 do
  begin
    TElement(FElements.Items[i]).Free;
  end;
  FElements.Free;
end;

procedure TObjectStructure.Accept(visitor:TVisitor );
var
  i:integer;
begin
  for i :=0  to FElements.Count-1 do
  begin
    TElement(FElements.Items[i]).Accept(visitor);
  end;

end;

procedure TObjectStructure.Attach(element:TElement);
begin
  FElements.Add(element);
end;

procedure TObjectStructure.Detach(element:TElement);
begin
  FElements.Remove(element);
end;

{
****************************** TConcreteVisitor1 *******************************
}
procedure TConcreteVisitor1.VisitConcreteElementA(
        ConcreteElementA:TConcreteElementA);
begin
  //ʾ���Դ���
  showmessage(self.ClassName+'������'+ConcreteElementA.ClassName);
  ConcreteElementA.OperationA;
end;

procedure TConcreteVisitor1.VisitConcreteElementB(
        ConcreteElementB:TConcreteElementB);
begin
  //ʾ���Դ���
  showmessage(self.ClassName+'������'+ConcreteElementB.ClassName);
  ConcreteElementB.OperationB;
end;

{
****************************** TConcreteVisitor2 *******************************
}
procedure TConcreteVisitor2.VisitConcreteElementA(
        ConcreteElementA:TConcreteElementA);
begin
  //ʾ���Դ���
  showmessage(self.ClassName+'������'+ConcreteElementA.ClassName);
  ConcreteElementA.OperationA;
end;

procedure TConcreteVisitor2.VisitConcreteElementB(
        ConcreteElementB:TConcreteElementB);
begin
  //ʾ���Դ���
  showmessage(self.ClassName+'������'+ConcreteElementB.ClassName);
  ConcreteElementB.OperationB;
end;


end.