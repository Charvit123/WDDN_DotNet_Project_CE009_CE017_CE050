<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSubject.aspx.cs" Inherits="Studentportal.AddSubject" %>

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
            max-height: 85%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 3rem;
        }
        img{
            display: block;
            max-width: 100%;
            width: 100%;
            height: 100vh;
            object-fit: cover;
            z-index: 1;
            position: relative;
        }
        .Title{
            font-family: 'Courier New', monospace;
            font-size: 3rem;
            font-weight: 600;
            margin: 2rem 0;
            padding: 1rem 0;
            text-align: center;
        }
        .label{
            font-size: 2rem;
            font-weight: 600;
            padding: 1rem;
            margin: 1rem 2rem;
            color: white;
        }
        .input{
            width: 100%;
            font-size: 2rem;
            line-height: 2rem;
            padding-left:10px;
            padding-bottom:3px;
            padding-top:3px;
            margin: 0;
            background: rgba(225,217,209,0.8);
            backdrop-filter: blur( 3px );
            border: 0;
            border-radius: 3px;
            outline: 0;
            display: block;
            line-height: 5px;
        }
        .valid{
            color: yellow;
        }
        .ubtn{
            text-align: center;
        }
        .button{
            font-size: 2rem;
            margin-top: 2rem;
            padding: 1rem 2rem;
            border: 0;
            border-radius: 3px;
            background: rgba(225,217,209,0.8);
        }
         .nav{
            position: fixed;
            z-index: 10;
        }
        ul{
           list-style: none;
           display: inline-flex;
           justify-content: flex-end;
           align-items: center;
           padding:0 1rem;
           font-size: 2rem;
           background: rgba( 1, 1, 1, 0.7 );
           backdrop-filter: blur( 10px );
           box-shadow: 0 8px 32px 0 rgba( 2, 2, 2, 0.37 );
           border: 1px solid rgba( 2, 2, 2, 0.1 );
           width: 98.5vw;
           height: 4rem;
        }
        li{
            margin: 0 2rem;
        }
        .an{
            color: white;
            text-decoration: none;
            padding: 0.8rem 0.1rem;
        }
        .an:hover{
            background: white;
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <ul class="nav-menu-inner">
                 <li>
                    <a runat="server" class="an" href="javascript: history.go(-1)">Go Back</a> 
                </li>
                <li>
                    <a runat="server" class="an" href="Login.aspx">Logout</a>
                </li>              
            </ul>
        </div>
    <img src="./Images/Login.jpg"/>
    <form id="form1" runat="server">
        <table >
            <tr>
                <td class="Title">Add Subject</td>
            </tr>
            <tr>
                <td class="label">Subject Name:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" CssClass="input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="valid" runat="server" ControlToValidate="TextBox1" ErrorMessage="Subjectname is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="label">Sem:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox2" CssClass="input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="valid" runat="server" ControlToValidate="TextBox2" ErrorMessage="Sem is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="label">Credit:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox3" CssClass="input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="valid" runat="server" ControlToValidate="TextBox3" ErrorMessage="Credit is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="label">Branch:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox4" CssClass="input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="valid" runat="server" ControlToValidate="TextBox4" ErrorMessage="Branch is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="ubtn">
                    <asp:Button ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click" Text="Add Subject" />
                </td>
            </tr>
        </table>
    </form>
        </div>
</body>
</html>
