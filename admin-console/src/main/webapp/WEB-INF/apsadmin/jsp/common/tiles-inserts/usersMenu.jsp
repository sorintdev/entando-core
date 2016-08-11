<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jacmswpsa" uri="/jacms-apsadmin-core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>


<script>
    $(document).ready(function () {
        $("#menu_item_content_new").click(function () {
            $(".rotate").toggleClass("down");
        })
    });
</script>

<div class="nav-side-menu">
    <div class="menu-list">
        <ul id="menu-content" class="menu-content collapse out">
            <li>
                <a href="#submenu-content-types">Users</a>
            </li>
            <ul class="sub-menu collapse in" id="Media">
                <li id="menu_item_user_list"  role="presentation"><a role="menuitem" href="<s:url action="list" namespace="/do/User"></s:url>">List of Users</a></li>
                <li id="menu_item_user_new"  role="presentation"><a role="menuitem" href="<s:url action="new" namespace="/do/User"></s:url>">Add User</a></li>
            </ul>
            <li>
                <a href="#">User Roles</a>
            </li>
            <ul class="sub-menu collapse in" id="layouts">
                <li id="menu_item_role_list"  role="presentation"><a role="menuitem" href="<s:url action="list" namespace="/do/Role"></s:url>">List of Roles</a></li>
                <li id="menu_item_role_new"  role="presentation"><a role="menuitem" href="<s:url action="new" namespace="/do/Role"></s:url>">Add Role</a></li>
            </ul>
            
            <li>
                <a href="#">User Profiles</a>
            </li>
            <ul class="sub-menu collapse in" id="layouts">
                <li id="menu_item_profile_list"  role="presentation"><a role="menuitem" href="<s:url action="initViewEntityTypes" namespace="/do/Entity"><s:param name="entityManagerName">UserProfileManager</s:param></s:url>">List of Profiles</a></li>
                <li id="menu_item_profile_new"  role="presentation"><a role="menuitem" href="<s:url action="initAddEntityType" namespace="/do/Entity"><s:param name="entityManagerName">UserProfileManager</s:param></s:url>">Add Profile</a></li>
            </ul>
             <li>
                <a href="#">Groups</a>
            </li>
            <ul class="sub-menu collapse in" id="layouts">
                <li id="menu_item_group_list"  role="presentation"><a role="menuitem" href="<s:url action="list" namespace="/do/Group"></s:url>">List of Groups</a></li>
                <li id="menu_item_group_new"  role="presentation"><a role="menuitem" href="<s:url action="new" namespace="/do/Group"></s:url>">Add Group</a></li>
            </ul>
            
            </ul>
        </div>
</div>
