<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Studentportal.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *{
            font-family: monospace;
            margin: 0;
        }
        #form1{
            position:absolute;
            background: rgba( 1, 1, 1, 0.37 );
            backdrop-filter: blur( 10px );
            box-shadow: 0 8px 32px 0 rgba( 2, 2, 2, 0.37 );
            border-radius: 10px;
            border: 1px solid rgba( 2, 2, 2, 0.1 );
            top: 50%;
            left: 50%;
            transform:translate(-50%, -50%);
            z-index:2;           
            width: 30%;
            max-height: 50%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        img{
            display: block;
            max-width: 100%;
            width: 100%;
            height: 100vh;
            object-fit: cover;
            z-index: 1;
            position: relative;
            opacity:0.9;
        }
        .Title{
            font-size: 3rem;
            margin: 2rem 0;
        }
        .label{
            font-size: 2rem;
            font-weight: 600;
        }
        .input{
            width: 100%;
            font-size: 2rem;
            line-height: 2rem;
            padding-left:10px;
            padding-bottom:3px;
            padding-top:3px;
            background: rgba(225,217,209,0.8);
            backdrop-filter: blur( 3px );
            border: 0;
            border-radius: 3px;
            outline: 0;
        }
        .input:hover{
            background: rgba(225,217,209,1);
        }
        .ubtn{
            text-align: center;
        }
        .button{
            font-size: 2rem;
            margin-top: 1rem;
            padding: 1rem 2rem;
            border: 0;
            border-radius: 3px;
            background: rgba(225,217,209,0.8);
        }
        .button:hover{
            background: rgba(225,217,209,1);
        }
        .valid{
            color: yellow;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="./Images/Login.jpg"/>
        <form id="form1" runat="server">
            <h2 class="Title">Login</h2>
            <table>
                <tr>
                    <td class="label">Id:</td>
                </tr>
                <tr>
                    <td>
                    <asp:TextBox ID="TextBox1" CssClass="input" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="valid" runat="server" ControlToValidate="TextBox1" ErrorMessage="Id is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label">Password: </td>
                </tr>
                <tr>
                    <td>
                    <asp:TextBox ID="TextBox2"  CssClass="input" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="valid" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="ubtn">
                    <asp:Button ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click" Text="Login" />
                    </td>
                </tr>
            </table>
    </form>
    </div>   
</body>
</html>