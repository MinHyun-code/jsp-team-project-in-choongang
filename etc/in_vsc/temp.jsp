<c:forEach var="intro_list" items="${intro_list }">
    <tr>
        <td style="display: none;">${intro_list.si_num }</td>
        <td>${intro_list.si_ques }</td>
        <td style="width: 100px"><input type="button" value="-" style="font-size: 25px;" class="btn_delete" onclick="javascript:rowDel_4(this); deleteList_si_num(${intro_list.si_num });"></td>
    </tr>
    <script>
        addList_si_num(${ intro_list.si_num });
    </script>
</c:forEach>