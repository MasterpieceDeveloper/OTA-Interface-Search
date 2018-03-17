//: @stopdocumentation
Unit TestOTAIntfSearch.Constants;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

Interface

Uses
  TestFramework;

Type
  TTestOTAIntfSearchConstants = Class(TTestCase)
  Strict Private
  Strict Protected
    Procedure TestRegEx(strPattern, strTestText : String; boolExpected : Boolean = True);
  Public
  Published
    Procedure TestInterfaceRegEx;
    Procedure TestProcedureStartRegEx;
    Procedure TestFunctionStartRegEx;
    Procedure TestPropertyStartRegEx;
    Procedure TestInterfaceObjectStart;
    Procedure TestMethodPropertyStart;
    Procedure TestEnd;
    Procedure TestSingleLineComment;
    Procedure TestMultiLineCommentEnd;
    Procedure TestMultiLineCommentStart;
    Procedure TestMethodStart;
    Procedure TestOpenParenthesis;
    Procedure TestCloseParenthesis;
    Procedure TestEndingSemiColon;
    Procedure TestInterfaceMethodSearchRegEx;
    Procedure TestInterfaceClassSearchRegEx;
    Procedure TestServiceRegEx;
    Procedure TestInterfaceClassIdentifier;
    Procedure TestGeneralIdentifier;
    Procedure TestNotifierSearchRegEx;
  End;

Implementation

Uses
  SysUtils,
  RegularExpressions,
  OTAIntfSearch.Constants;

{ TTestOTAIntfSearchConstants }

Procedure TTestOTAIntfSearchConstants.TestCloseParenthesis;

Begin
  TestRegEx(strCloseParenthesisRegEx, ')');
  TestRegEx(strCloseParenthesisRegEx, ');');
  TestRegEx(strCloseParenthesisRegEx, ')  ');
  TestRegEx(strCloseParenthesisRegEx, ')  ;  ');
  TestRegEx(strCloseParenthesisRegEx, '  Procedure Hello()');
  TestRegEx(strCloseParenthesisRegEx, '  Procedure Hello( i :  Integer) ; ');
End;

Procedure TTestOTAIntfSearchConstants.TestEnd;

Begin
  TestRegEx(strEndRegEx, 'end;');
  TestRegEx(strEndRegEx, '  end;');
  TestRegEx(strEndRegEx, #9'end;');
  TestRegEx(strEndRegEx, '  end  ;');
  TestRegEx(strEndRegEx, '  end  ;  ');
End;

Procedure TTestOTAIntfSearchConstants.TestEndingSemiColon;

Begin
  TestRegEx(strEndingSemiColonRegEx, ';');
  TestRegEx(strEndingSemiColonRegEx, '  ;');
  TestRegEx(strEndingSemiColonRegEx, '  ;  ');
  TestRegEx(strEndingSemiColonRegEx, '  Hello  ;  ');
End;

Procedure TTestOTAIntfSearchConstants.TestFunctionStartRegEx;

Begin
  TestRegEx(strFunctionStartRegEx, 'Function Hello : Integer;');
  TestRegEx(strFunctionStartRegEx, '  Function Hello : Integer;');
  TestRegEx(strFunctionStartRegEx, #9'Function Hello : Integer;');
  TestRegEx(strFunctionStartRegEx, '  Function Hello() : Integer;');
  TestRegEx(strFunctionStartRegEx, '  Function Hello(str : String) : Integer;');
End;

Procedure TTestOTAIntfSearchConstants.TestGeneralIdentifier;

Begin
  TestRegEx(strGeneralIdentifier, 'MyHello');
  TestRegEx(strGeneralIdentifier, 'iMyHello');
  TestRegEx(strGeneralIdentifier, '  iMyHello90 ');
End;

Procedure TTestOTAIntfSearchConstants.TestInterfaceClassIdentifier;

Begin
  TestRegEx(strInterfaceClassIdentifier, 'TMyHello');
  TestRegEx(strInterfaceClassIdentifier, '  IMyHello  ');
  TestRegEx(strInterfaceClassIdentifier, '  TMyHello90');
  TestRegEx(strInterfaceClassIdentifier, ' IMy90Hello120 ');
End;

Procedure TTestOTAIntfSearchConstants.TestInterfaceClassSearchRegEx;

//Var
//  strSearch : String;

Begin
//  strSearch := Format(strInterfaceClassSearchRegEx, ['IMyOtherInterface']);
//  TestRegEx(strSearch, 'IMyInterface=Interface;', False);
//  TestRegEx(strSearch, '  IMyInterface  =  Interface  ;  ', False);
//  TestRegEx(strSearch, ' IMyInterface = Interface(IMyOtherInterface) ;');
//  TestRegEx(strSearch, 'IMyOtherInterface = Interface(IMyInterface);', False);
End;

Procedure TTestOTAIntfSearchConstants.TestInterfaceMethodSearchRegEx;

Const
  strInterfaceMethodSearchRegEx =
    '^( |\t)*property *[a-z]+ *: *%s *read *.*; *|' +
    '^( |\t)*property *[a-z]+ *[\[].*[\]] *: *%s *read *.*; *|' +
    '^( |\t)*function *[a-z]+ *: *%s *; *|' +
    '^( |\t)*function *[a-z]+ *[\(].*[\)] *: *%s *; *';

Var
  strSearchText : String;

Begin
  strSearchText :=  Format(strInterfaceMethodSearchRegEx, ['IMyInterface', 'IMyInterface',
    'IMyInterface', 'IMyInterface']);
  TestRegEx(strSearchText, 'function Hello: IMyInterface;');
  TestRegEx(strSearchText, '  function Hello : IMyInterface  ;  ');
  TestRegEx(strSearchText, '  function Hello( i : integer) : IMyInterface  ;  ');
  TestRegEx(strSearchText, '  function Hello ( i : IMyInterface) : IMyOtherInterface  ;  ', False);
  TestRegEx(strSearchText, 'Property Hello:IMyInterface Read GetHello;');
  TestRegEx(strSearchText, '  Property Hello  :  IMyInterface Read GetHello ; ');
  TestRegEx(strSearchText, '  Property Hello[i: : Integer]  :  IMyInterface Read GetHello ; ');
  TestRegEx(strSearchText, '  Property Hello[i: : UMyInterface]  :  IMyOtherInterface Read GetHello ; ', False);
End;

Procedure TTestOTAIntfSearchConstants.TestInterfaceObjectStart;

Begin
  TestRegEx(strInterfaceObjectStartRegEx, 'IMyInterface = Interface;');
  TestRegEx(strInterfaceObjectStartRegEx, '  IMyInterface = Interface;');
  TestRegEx(strInterfaceObjectStartRegEx, #9'IMyInterface = Interface;');
  TestRegEx(strInterfaceObjectStartRegEx, '  IMyInterface = Interface(IMyOtherInterface)');
  TestRegEx(strInterfaceObjectStartRegEx, 'TMyObject = Class');
  TestRegEx(strInterfaceObjectStartRegEx, '  TMyObject = Class');
  TestRegEx(strInterfaceObjectStartRegEx, #9'TMyObject = Class');
  TestRegEx(strInterfaceObjectStartRegEx, 'TMyObject = Class(TObject)');
  TestRegEx(strInterfaceObjectStartRegEx, '  TMyObject = Class(TObject, IMyInterface)');
End;

Procedure TTestOTAIntfSearchConstants.TestInterfaceRegEx;

Begin
  TestRegEx(strInterfaceRegEx, 'IMyInterface = Interface');
  TestRegEx(strInterfaceRegEx, '  IMyInterface = Interface;');
  TestRegEx(strInterfaceRegEx, #9'IMyInterface = Interface;');
  TestRegEx(strInterfaceRegEx, '  IMyInterface = Interface(IMyOtherInterface)');
End;

Procedure TTestOTAIntfSearchConstants.TestMethodPropertyStart;

Begin
  TestRegEx(strMethodPropertyStartRegEx, 'Procedure Hello;');
  TestRegEx(strMethodPropertyStartRegEx, '  Procedure Hello;');
  TestRegEx(strMethodPropertyStartRegEx, '  Procedure Hello();');
  TestRegEx(strMethodPropertyStartRegEx, #9'Procedure Hello();');
  TestRegEx(strMethodPropertyStartRegEx, '  Procedure Hello(i : Integer);');
  TestRegEx(strMethodPropertyStartRegEx, 'Function Hello : Integer;');
  TestRegEx(strMethodPropertyStartRegEx, '  Function Hello : Integer;');
  TestRegEx(strMethodPropertyStartRegEx, '  Function Hello() : Integer;');
  TestRegEx(strMethodPropertyStartRegEx, #9'Function Hello() : Integer;');
  TestRegEx(strMethodPropertyStartRegEx, '  Function Hello(str : String) : Integer;');
  TestRegEx(strMethodPropertyStartRegEx, 'Property Hello;');
  TestRegEx(strMethodPropertyStartRegEx, '  Property Hello;');
  TestRegEx(strMethodPropertyStartRegEx, #9'Property Hello;');
  TestRegEx(strMethodPropertyStartRegEx, '  Property Hello Read GetHello;');
  TestRegEx(strMethodPropertyStartRegEx, 'Property Hello[i : Integer] Read Hello;');
End;

Procedure TTestOTAIntfSearchConstants.TestMethodStart;

Begin
  TestRegEx(strMethodStartRegEx, 'Procedure Hello;');
  TestRegEx(strMethodStartRegEx, '  Procedure Hello;');
  TestRegEx(strMethodStartRegEx, '  Procedure Hello();');
  TestRegEx(strMethodStartRegEx, '  Procedure Hello(i : Integer);');
  TestRegEx(strMethodStartRegEx, 'Function Hello : Integer;');
  TestRegEx(strMethodStartRegEx, '  Function Hello : Integer;');
  TestRegEx(strMethodStartRegEx, '  Function Hello() : Integer;');
  TestRegEx(strMethodStartRegEx, '  Function Hello(str : String) : Integer;');
End;

Procedure TTestOTAIntfSearchConstants.TestMultiLineCommentEnd;

Begin
  TestRegEx(strMultiLineCommentEndRegEx, 'This is a comment}');
  TestRegEx(strMultiLineCommentEndRegEx, '  This is a comment}');
  TestRegEx(strMultiLineCommentEndRegEx, '  This is a comment  }');
  TestRegEx(strMultiLineCommentEndRegEx, '  This is a comment  }  ');
End;

Procedure TTestOTAIntfSearchConstants.TestMultiLineCommentStart;

Begin
  TestRegEx(strMultiLineCommentStartRegEx, '{This is a comment');
  TestRegEx(strMultiLineCommentStartRegEx, '{  This is a comment');
  TestRegEx(strMultiLineCommentStartRegEx, '  {  This is a comment');
  TestRegEx(strMultiLineCommentStartRegEx, '  {  This is a comment  ');
End;

Procedure TTestOTAIntfSearchConstants.TestNotifierSearchRegEx;

Begin
  TestRegEx(Format(strNotifierSearchRegEx, ['IOTAIDENotifier']),
    'AddNotifier(Notifier : IOTAIDENotifier)')
End;

Procedure TTestOTAIntfSearchConstants.TestOpenParenthesis;

Begin
  TestRegEx(strOpenParenthesisRegEx, '(');
  TestRegEx(strOpenParenthesisRegEx, 'Procedure Hello(');
  TestRegEx(strOpenParenthesisRegEx, 'Procedure Hello();');
  TestRegEx(strOpenParenthesisRegEx, '  Procedure Hello( i : Integer ) ; ');
End;

Procedure TTestOTAIntfSearchConstants.TestProcedureStartRegEx;

Begin
  TestRegEx(strProcedureStartRegEx, 'Procedure Hello;');
  TestRegEx(strProcedureStartRegEx, '  Procedure Hello;');
  TestRegEx(strProcedureStartRegEx, '  Procedure Hello();');
  TestRegEx(strProcedureStartRegEx, #9'Procedure Hello();');
  TestRegEx(strProcedureStartRegEx, '  Procedure Hello(i : Integer);');
End;

Procedure TTestOTAIntfSearchConstants.TestPropertyStartRegEx;

Begin
  TestRegEx(strPropertyStartRegEx, 'Property Hello;');
  TestRegEx(strPropertyStartRegEx, '  Property Hello;');
  TestRegEx(strPropertyStartRegEx, #9'Property Hello;');
  TestRegEx(strPropertyStartRegEx, '  Property Hello Read GetHello;');
  TestRegEx(strPropertyStartRegEx, 'Property Hello[i : Integer] Read Hello;');
End;

Procedure TTestOTAIntfSearchConstants.TestRegEx(strPattern, strTestText: String;
  boolExpected : Boolean = True);

Var
  RegEx : TRegEx;
  M: TMatch;

Begin
  RegEx := TRegEx.Create(strPattern, [roIgnoreCase, roSingleLine]);
  M := RegEx.Match(strTestText);
  CheckEquals(boolExpected, M.Success, Format('%s in [%s] Failed', [strPattern, strTestText]));
End;

Procedure TTestOTAIntfSearchConstants.TestServiceRegEx;

Begin
  TestRegEx(strServiceRegEx, 'IMyServices = Interface;');
  TestRegEx(strServiceRegEx, '  IMyServices = Interface;');
  TestRegEx(strServiceRegEx, #9'IMyServices = Interface ; ');
  TestRegEx(strServiceRegEx, 'IOTAEditorServices = Interface(IMyOtherInterface);');
End;

Procedure TTestOTAIntfSearchConstants.TestSingleLineComment;

Begin
  TestRegEx(strSingleLineCommentRegEx, '{ Hello Dave. }');
  TestRegEx(strSingleLineCommentRegEx, ' { Hello Dave. }');
  TestRegEx(strSingleLineCommentRegEx, '  { Hello Dave. }  ');
  TestRegEx(strSingleLineCommentRegEx, '{ Hello Dave. }  ');
End;

Initialization
  RegisterTest(TTestOTAIntfSearchConstants.Suite);
End.
