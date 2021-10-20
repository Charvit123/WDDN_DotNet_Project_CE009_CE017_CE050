<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCourses.aspx.cs" Inherits="Studentportal.MyCourses" %>

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
            max-height: 55%;
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
            color:white;
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
        <h2 class="Title">Courses</h2>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageButtonCount="4" OnPageIndexChanging="GridView1_PageIndexChanging"  AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="12" ForeColor="Black" GridLines="None" PageSize="5">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:BoundField DataField="Subjectname" HeaderText="Subjectname" SortExpression="Subjectname" />
                    <asp:BoundField DataField="Sem" HeaderText="Sem" SortExpression="Sem" />
                    <asp:BoundField DataField="Credit" HeaderText="Credit" SortExpression="Credit" />
                    <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
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
    </div>
</body>
</html>