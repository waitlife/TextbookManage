﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BooksellerFeedBack.aspx.cs"
    Inherits="TextbookManage.WebUI.FeedBack.BooksellerFeedBack" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>书商回告</title>
</head>
<body>
    <form id="form1" runat="server">

        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdatePanelsRenderMode="Inline">
            <ClientEvents OnRequestStart="onRequestStart" />
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ccmbTerm" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="cgrdOrderSet" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="ccmbTerm">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="cgrdOrderSet" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="cgrdOrderSet">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="cgrdOrderSet" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadCodeBlock runat="server">
            <script type="text/javascript">
                //如果点击的是导出按钮则将AJAX禁用
                function onRequestStart(sender, args) {
                    if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                            args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                            args.get_eventTarget().indexOf("ExportToPdfButton") >= 0 ||
                            args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
                        args.set_enableAjax(false);
                    }
                }
                //教材详单弹窗
                function OnRequestTextbook(TextbookId) {
                    var oWnd = $find("<%=wdw_TextbookDetailMessage.ClientID%>");
                    oWnd.setUrl(encodeURI("../WindowForMessage/TextbookDetailMessage.aspx?TextbookID=" + TextbookId)); //
                    oWnd.show();
                    oWnd.setSize(600, 300);
                }

            </script>
        </telerik:RadCodeBlock>

        <div>
            <utm:UTMisToolBar ID="CPMisToolBar1" runat="server" SkinID="Long">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="帮助" ImageUrl="~/Img/tlb_Help.png">
                    </telerik:RadToolBarButton>
                </Items>
            </utm:UTMisToolBar>
            <utm:UTMisTabStrip runat="server" ID="ctspHead" MultiPageID="mp_Feedback">
                <Tabs>
                    <utm:UTMisTab runat="server" Text="书商回告" PageViewID="pv_Feedback" Selected="true">
                    </utm:UTMisTab>
                </Tabs>
            </utm:UTMisTabStrip>
            <utm:UTMisMultiPage runat="server" ID="mp_Feedback" SkinID="Long">
                <utm:UTMisPageView runat="server" ID="pv_Feedback">
                    <table>
                        <tr>
                            <td>
                                <utm:UTMisComboBox runat="server" ID="ccmbTerm" Label="学期：" SkinID="cmb200" AutoPostBack="true" IsMaintainSelectedValue="true"
                                    DataTextField="Description" DataValueField="YearTerm"
                                    OnDataBinding="ccmbTerm_DataBinding"
                                    OnSelectedIndexChanged="ccmbTerm_SelectedIndexChanged">
                                </utm:UTMisComboBox>
                            </td>
                            <td>
                                <utm:UTMisLabel ID="clblResult" runat="server" Text="回告结果：" SkinID="AutoSize"></utm:UTMisLabel>
                            </td>
                            <td>
                                <utm:UTMisRadioButtonList runat="server" ID="crdlFeedbackState" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="征订成功" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="征订失败" Value="0"></asp:ListItem>
                                </utm:UTMisRadioButtonList>
                            </td>
                            <td colspan="2">
                                <utm:UTMisTextBox ID="ctxt_Sign" runat="server" Enabled="false" Label="回告人：">
                                </utm:UTMisTextBox>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <utm:UTMisTextBox runat="server" ID="ctxtRemark" Width="300" SkinID="Multi" Label="回告说明：" LabelWidth="80">
                                </utm:UTMisTextBox>
                            </td>
                            <td>
                                <utm:UTMisButton runat="server" ID="cbtnQuery" Text="刷新" Width="60" OnClick="cbtnQuery_Click" />
                            </td>
                            <td>
                                <utm:UTMisButton runat="server" ID="cbtnSubmit" Text="提交" Width="60" OnClick="cbtnSubmit_Click" OnAfterClick="cbtnQuery_Click" />
                            </td>
                        </tr>
                    </table>
                    <utm:UTMisGrid runat="server" ID="cgrdOrderSet" SkinID="NoExport" CheckControlID="cchkRowCheck"
                        OnBeforeDataBind="cgrdOrderSet_BeforeDataBind" OnBeforePageIndexChanged="cgrdOrderSet_BeforePageIndexChanged">
                        <MasterTableView AllowPaging="true" PageSize="10" EnableNoRecordsTemplate="true" NoMasterRecordsText="没有数据可以显示">
                            <PagerStyle Mode="NextPrevAndNumeric" PagerTextFormat="{4}第{0}页 共{1}页" PageButtonCount="4" />
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="cchkCheck" DataField="CheckFlag" HeaderStyle-Width="40px">
                                    <HeaderTemplate>
                                        <utm:UTMisCheckBox runat="server" ID="cchkCheckAll" AutoPostBack="true" OnCheckedChanged="cchkCheckAll_CheckedChanged"></utm:UTMisCheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <utm:UTMisCheckBox runat="server" ID="cchkRowCheck"></utm:UTMisCheckBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="序号" HeaderStyle-Width="40">
                                    <ItemTemplate>
                                        <%#Container .DataSetIndex +1 %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="教材编号" DataField="Num" HeaderStyle-Width="80">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="教材名称" DataField="Name" HeaderStyle-Width="200">
                                    <ItemTemplate>
                                        <a href="#" onclick="OnRequestTextbook('<%#Eval ("TextbookId") %>')">
                                            <%# Eval("Name")%></a>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="征订数量" DataField="DeclarationCount" HeaderStyle-Width="80">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="上抛数量" DataField="SpareCount" HeaderStyle-Width="80">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="小计" DataField="TotalCount" HeaderStyle-Width="80">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="征订日期" DataField="SubscriptionDate" HeaderStyle-Width="120">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </utm:UTMisGrid>
                </utm:UTMisPageView>
            </utm:UTMisMultiPage>
        </div>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            <Windows>
                <telerik:RadWindow ID="wdw_TextbookDetailMessage" runat="server" Top="150" Left="400" Modal="true"
                    ReloadOnShow="true">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
    </form>
</body>
</html>
