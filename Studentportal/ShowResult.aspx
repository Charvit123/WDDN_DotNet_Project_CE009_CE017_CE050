<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowResult.aspx.cs" Inherits="Studentportal.ShowResult" %>

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
            width: 40%;
            max-height: 70%;
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
            font-family: 'Courier New', monospace;
            font-size: 3rem;
            font-weight: 600;
            margin: 2rem 0;
            text-align: center;
        }
        .label{
            font-size: 2rem;
            font-weight: 600;
            color: white;
        }
        .inputgroup{
            display:flex;
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
        .filter{
            margin: 0 2rem;
        }
        .button{
            font-size: 2rem;
            margin: 2rem;
            padding: 0.6rem 1rem;
            border: 0;
            border-radius: 3px;
            background: rgba(204,153,102,0.9);
        }
        .button:hover{
            background: rgba(225,217,209,1);
        }
        .edit{
            text-decoration:none;
            color: blue;
        }
        .delete{
            text-decoration: none;
            color: red;
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
    <script>
        var param = sessionStorage.getItem("IsAdmin");
        var p = HttpContext.Current.Session["IsAdmin"];
        console.log(p);
</script>
</head>
<body>
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
        <h2 class="Title">Your Result</h2>
        <div class="inputgroup">
            <div class="filter">
            <p class="label">Sem:</p>
            <asp:DropDownList ID="DropDownList1" CssClass="input" runat="server">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>     
            </div>
            <asp:Button ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click1" Text="Filter" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageButtonCount="4" OnPageIndexChanging="GridView1_PageIndexChanging"  AutoGenerateColumns="False" DataKeyNames="Id" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="15" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="Subjectname" HeaderText="Subjectname" SortExpression="Subjectname" />
                <asp:BoundField DataField="Sem" HeaderText="Sem" SortExpression="Sem" />
                <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
                <asp:BoundField DataField="Maxmarks" HeaderText="Maxmarks" SortExpression="Maxmarks" />
                <asp:BoundField DataField="Marks" HeaderText="Marks" SortExpression="Marks" />
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="edit" CssClass="edit" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="cedit">Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="delete" CssClass="delete" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="cdelete" >Remove</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </form>

</body>
</html>