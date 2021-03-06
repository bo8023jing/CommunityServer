﻿<%@ Control Language="C#" AutoEventWireup="false" EnableViewState="false" %>
<%@ Import Namespace="ASC.Web.Core.WhiteLabel" %>
<%@ Import Namespace="ASC.Web.Studio.Utility" %>
<%@ Import Namespace="Microsoft.Ajax.Utilities" %>
<%@ Import Namespace="Resources" %>

<%-- Empty screen control --%>
<script id="template-emptyScreen" type="text/x-jquery-tmpl">
    <div id="${ID}" class="noContentBlock emptyScrCtrl{{if typeof(CssClass)!="undefined"}} ${CssClass}{{/if}}" >
        {{if typeof(ImgSrc)!="undefined" && ImgSrc != null && ImgSrc != ""}}
        <table>
            <tr>
                <td>
                    <img src="${ImgSrc}" alt="" class="emptyScrImage" />
                </td>
                <td>
                    <div class="emptyScrTd">
        {{/if}}
                    {{if typeof(Header)!="undefined" && Header != null && Header != ""}}
                        <div class="header-base-big">${Header}</div>
                    {{/if}}
                    {{if typeof(HeaderDescribe)!="undefined" && HeaderDescribe != null && HeaderDescribe != ""}}
                        <div class="emptyScrHeadDscr">${HeaderDescribe}</div>
                    {{/if}}
                    {{if typeof(Describe)!="undefined" && Describe != null && Describe != ""}}
                        <div class="emptyScrDscr">{{html Describe}}</div>
                    {{/if}}
                    {{if typeof(ButtonHTML)!="undefined" && ButtonHTML != null && ButtonHTML != ""}}
                        <div class="emptyScrBttnPnl">{{html ButtonHTML}}</div>
                    {{/if}}
        {{if typeof(ImgSrc)!="undefined" && ImgSrc != null && ImgSrc != ""}}
                    </div>
                </td>
            </tr>
        </table>
        {{/if}}
    </div>
</script>


<%-- BlockUI screen control --%>

<script id="template-blockUIPanel" type="text/x-jquery-tmpl">
    <div style="display:none;" id="${id}">
        <div class="popupContainerClass">
            <div class="containerHeaderBlock">
                <table cellspacing="0" cellpadding="0" border="0" style="width:100%; height:0px;">
                    <tbody>
                        <tr valign="top">
                            <td {{if typeof(headerClass) != "undefined" && headerClass != ""}}class="${headerClass}"{{/if}}>${headerTest}</td>
                            <td class="popupCancel">
                                <div onclick="PopupKeyUpActionProvider.CloseDialog();" class="cancelButton" title="<%= Resources.Resource.CloseButton %>">&times;</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="infoPanel{{if typeof(infoType) != "undefined" && infoType != ""}} ${infoType}{{/if}}"
                    {{if typeof(infoMessageText) == "undefined" || infoMessageText == ""}}style="display:none;"{{/if}}>
                <div>{{if typeof(infoMessageText) != "undefined" && infoMessageText != ""}}${infoMessageText}{{/if}}</div>
            </div>
            <div class="containerBodyBlock">
                {{if typeof(questionText) != "undefined" && questionText != ""}}
                <div>
                    <b>${questionText}</b>
                </div>
                {{/if}}

                {{html innerHtmlText}}

            {{if typeof(OKBtn) != 'undefined' && OKBtn != "" || typeof(OtherBtnHtml) != 'undefined' || typeof(CancelBtn) != 'undefined' && CancelBtn != ""}}
            <div class="middle-button-container">
                {{if typeof(OKBtn) != 'undefined' && OKBtn != ""}}
                <a class="button blue middle{{if typeof(OKBtnClass) != 'undefined'}} ${OKBtnClass}{{/if}}"
                    {{if typeof(OKBtnID) != 'undefined'}}id="${OKBtnID}"{{/if}}
                    {{if typeof(OKBtnHref) != 'undefined' && OKBtnHref != ""}} href="${OKBtnHref}"{{/if}}>
                    ${OKBtn}
                </a>
                <span class="splitter-buttons"></span>
                {{/if}}
                {{if typeof(OtherBtnHtml) != 'undefined'}}
                    {{html OtherBtnHtml}}
                    <span class="splitter-buttons"></span>
                {{/if}}
                {{if typeof(CancelBtn) != 'undefined' && CancelBtn != ""}}
                <a class="button gray middle{{if typeof(CancelBtnClass) != 'undefined'}} ${CancelBtnClass}{{/if}}"
                    {{if typeof(CancelBtnID) != 'undefined'}}id="${CancelBtnID}"{{/if}}
                    onclick="PopupKeyUpActionProvider.EnableEsc = true; jq.unblockUI();">
                    ${CancelBtn}
                </a>
                {{/if}}
            </div>
            {{/if}}
        </div>
        </div>
    </div>
</script>


<%-- Attachments control --%>

<script id="template-newFile" type="text/x-jquery-tmpl">
    <tr class="newDoc">
        <td class="${tdclass}" colspan="2">
            <input id="newDocTitle" type="text" class="textEdit" data="<%= UserControlsCommonResource.NewDocument%>" maxlength="165" value="<%= UserControlsCommonResource.NewDocument%>"/>
            <span id="${type}" onclick="${onCreateFile}" class="button gray btn-action __apply createFile" title="<%= Resource.AddButton%>"></span>
            <span onclick="${onRemoveNewDocument}" title="<%= UserControlsCommonResource.QuickLinksDeleteLink%>" class="button gray btn-action __reset remove"></span>
        </td>        
    </tr>
</script>

<script id="template-fileAttach" type="text/x-jquery-tmpl">
    <tr>
        <td id="af_${id}">
            {{if type=="image"}}
                <a href="${viewUrl}" rel="imageGalery" class="screenzoom ${exttype}" title="${title}">
                    <div class="attachmentsTitle">${title}</div>
                    {{if versionGroup > 1}}
                        <span class="version"><%= UserControlsCommonResource.Version%>${versionGroup}</span>
                    {{/if}}
                </a>
            {{else}}
                {{if type == "editedFile" || type == "viewedFile"}}
                    <a href="${docViewUrl}" class="${exttype}" title="${title}" target="_blank">
                        <div class="attachmentsTitle">${title}</div>
                        {{if versionGroup > 1}}
                            <span class="version"><%= UserControlsCommonResource.Version%>${versionGroup}</span>
                        {{/if}}
                    </a>
                {{else}}
                    <a href="${downloadUrl}" class="${exttype} noEdit" title="${title}" target="_blank">
                        <div class="attachmentsTitle">${title}</div>
                        {{if versionGroup > 1}}
                            <span class="version"><%= UserControlsCommonResource.Version%>${versionGroup}</span>
                        {{/if}}
                    </a>
                {{/if}}
            
            {{/if}}
        </td>
    
        <td class="editFile">
            {{if (access==0 || access==1)}}
                <a class="{{if trashAction == "delete"}}deleteDoc{{else}}unlinkDoc{{/if}}" title="{{if trashAction == "delete"}}<%= UserControlsCommonResource.DeleteFile%>{{else}}<%= UserControlsCommonResource.RemoveFromList%>{{/if}}" data-fileId="${id}"></a>
            {{/if}}
            {{if (!jq.browser.mobile)}}
            <a class="downloadLink" title="<%= UserControlsCommonResource.DownloadFile%>" href="${downloadUrl}"></a>
            {{/if}}
            {{if (type == "editedFile")&&(access==0 || access==1)}}
                <a id="editDoc_${id}" title="<%= UserControlsCommonResource.EditFile%>" target="_blank" href="${editUrl}"></a>
            {{/if}}
        </td>
    </tr>
</script>



<%-- AccountLinkControl control --%>

<script id="template-accountLinkCtrl" type="text/x-jquery-tmpl">
    <div class="account-links tabs-content">
        <ul class="clearFix">
            {{each(i, acc) infos}}
            <li class="${acc.Provider}{{if acc.Linked == true}} connected{{/if}}">
                <span class="label"></span>
                <span {{if acc.Linked == true}} class="linked"{{/if}}>
                    {{if acc.Linked == true}}
                        <%= Resources.Resource.AssociateAccountConnected %>
                    {{else}}
                        <%= Resources.Resource.AssociateAccountNotConnected %>
                    {{/if}}
                </span> 
                <a href="${acc.Url}" class="popup{{if acc.Linked == true}} linked{{/if}}" id="${acc.Provider}">
                    {{if acc.Linked == true}}
                        <%= Resources.Resource.AssociateAccountDisconnect %>
                    {{else}}
                        <%= Resources.Resource.AssociateAccountConnect %>
                    {{/if}}
                </a>
            </li>
            {{/each}}
        </ul>
    </div>
</script>


<%-- ASC.Mail.Utility templates --%>

<script id="template-mailCalendar" type="text/x-jquery-tmpl">
    <div style="background-color: #fff; width: 600px; margin: 0 auto; text-align: left;">
      <table cellspacing="0" cellpadding="0" style="font-family: 'Open Sans', Tahoma, Arial; font-size: 14px; color: #333; background: #fff; text-align: center; width: 600px; margin: 0; padding: 0; border: 0 none; border-collapse: collapse; empty-cells: show; border-spacing: 0;">
        <tbody>
          <tr border="0" cellspacing="0" cellpadding="0">
            <td colspan="3" style="margin: 0; padding: 0; background-color: #fff; height: 65px; padding: 20px 0 0 30px;">
              <div style="text-align: left; height: 65px; width: 570px; margin: 0; padding: 0;">
                <a href="http://www.onlyoffice.com/"
                style="text-decoration: none; display: inline-block; width: 216px; height: 35px; margin: 0; padding: 0;"
                target="_blank">
                  <img style="border: 0px none; width: 216px; height: 35px; margin: 0; padding: 0;"
                  src="<%= CommonLinkUtility.GetFullAbsolutePath(TenantLogoManager.GetLogoDark(true)) %>" />
                </a>
              </div>
            </td>
          </tr>
          <tr border="0" cellspacing="0" cellpadding="0">
            <td colspan="3" style="margin: 0; padding: 15px 30px 15px; background-color: #f6f6f6; -moz-border-radius: 6px; -webkit-border-radius: 6px; border-radius: 6px;">
              <div style="font-family: 'Open Sans', Tahoma, Arial; font-size: 14px; color: #333; margin: 0; padding: 0; width: 540px; height: auto; overflow: hidden; word-wrap: break-word; vertical-align: top; text-align: left; border: 0 none;">
                <div style="font-family: 'Open Sans', Tahoma, Arial; font-size: 14px; color: #333; padding: 5px 0 10px 0; width: 540px; overflow: hidden; word-wrap: break-word;">
                    <table cellpadding="0" cellspacing="0" style="font-family: 'Open Sans', Tahoma, Arial; border-collapse: collapse; height: 132px; width:100%;">
                      <tr>
                        <td colspan="3" style="padding-bottom: 16px;">
                            <table cellpadding="0" cellspacing="0" style="font-family: 'Open Sans', Tahoma, Arial; border-collapse: collapse;">
                                <tbody>
                                    <tr>
                                        <td style="vertical-align: top; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px; padding-bottom: 8px;">${action}</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; font-family: 'Open Sans', Tahoma, Arial; font-size: 24px;">${summary}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                      </tr>
                      <tr>
                        <td width="66" height="66" align="left" valign="top" style="width: 66px; height: 66px;">
                            <img style="border: 0px none; width: 66px; height: 66px; margin: 0; padding: 0;" src="<%= CommonLinkUtility.GetFullAbsolutePath("/skins/default/images/event_66.png") %>" />
                        </td>
                        <td style="padding-left: 16px;">
                            <table cellpadding="0" cellspacing="0" style="font-family: 'Open Sans', Tahoma, Arial; border-collapse: collapse;">
                                <tbody>
                                    <tr>
                                        <td style="vertical-align: top; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px; color: rgb(153, 153, 153);"><%=Resource.MailIcsCalendarWhenLabel%>:</td>
                                        <td style="vertical-align: top; padding-left: 8px; padding-bottom: 8px; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px;" title="${dateEvent}">
                                            ${dateEvent}
                                        </td>
                                    </tr>
                                    {{if typeof(rruleText) != 'undefined' && rruleText != '' && rruleText != null }}
                                    <tr>
                                        <td style="vertical-align: top; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px; color: rgb(153, 153, 153);"><%=Resource.MailIcsCalendarRecurrenceLabel%>:</td>
                                        <td style="vertical-align: top; padding-left: 8px; padding-bottom: 8px; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px;" title="${dateEvent}">
                                            ${rruleText}
                                        </td>
                                    </tr>
                                     {{/if}}
                                    <tr>
                                        <td style="vertical-align: top; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px; color: rgb(153, 153, 153);"><%=Resource.MailIcsCalendarWhereLabel%>:</td>
                                        <td style="vertical-align: top; padding-left: 8px; padding-bottom: 8px; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px; " {{if typeof(location) != 'undefined' &&  location != ''&& location != null }}title="${location}"{{/if}}>
                                            {{if typeof(location) != 'undefined' && location != '' && location != null }}
                                                ${location}
                                                {{if typeof(mapUrl) != 'undefined' && mapUrl != '' && mapUrl != null }}
                                                    &nbsp;<a href="${mapUrl}" target="_blank" style="color: #333333;">(<%=Resource.MailIcsCalendarMapLabel%>)</a>
                                                {{/if}}
                                            {{else}}
                                                <%=Resource.MailIcsCalendarNoLocationLabel%>
                                            {{/if}}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px; color: rgb(153, 153, 153);"><%=Resource.MailIcsCalendarWhoLabel%>:</td>
                                        <td style="vertical-align: top; padding-left: 8px; padding-bottom: 8px; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px;">
                                            {{if orgEmail !== '' }}
                                                <a title="${orgEmail}" name="${orgName}" href="${mailToHref}" style="color: #333333;">
                                                    {{if typeof(orgName) != 'undefined' && orgName != '' && orgName != null }}
                                                        ${orgName}
                                                    {{else}}
                                                        ${orgEmail}
                                                    {{/if}}
                                                </a>
                                            {{else}}
                                                ${orgName}
                                            {{/if}}&nbsp;(<%=Resource.MailIcsCalendarOrganizerLabel%>)
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                      </tr>
                    </table>
                 </div>
              </div>
            </td>
          </tr>
          <tr border="0" cellspacing="0" cellpadding="0">
            <td colspan="5" style="width: 600px; vertical-align: top; margin: 0; padding: 20px 30px 15px;">
              <p style="color: #7b7b7b; font-family: 'Open Sans', Tahoma, Arial; font-size: 12px; margin: 0; padding: 0; text-align: center; width: 540px;">
              <%= Resource.MailAutoGeneratedText %>
              <br />
              <%= Resource.AllRightsReservedText.FormatInvariant(DateTime.UtcNow.Year) %></p>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
</script>