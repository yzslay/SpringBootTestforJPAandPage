$(document).ready(function(){
	// Activate tooltips
	$('[data-toggle="tooltip"]').tooltip();
    
	// Filter table rows based on searched term  keyup(放開鍵盤的那個剎那)
    $("#search").on("keyup", function() {
        var term = $(this).val().toLowerCase();
        $("table tbody tr").each(function(){
            $row = $(this);
            var name = $row.find("td:nth-child(2)").text().toLowerCase();
            console.log(name);
            if(name.search(term) < 0){                
                $row.hide();
            } else{
                $row.show();
            }
        });
    });
});


$(document).ready(function(){    // 全選Checkbox
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});

$(document).ready(function(){
	// Activate tooltips
	$('[data-toggle="tooltip"]').tooltip();
    
	// delete one
   $(".delete").click(function(){
        var delid=$(this).prevAll("input").val();
        $("#deleteEmployeeModal #id").val(delid);      
    });

    // delete all
    $("a[class='btn btn-danger']").click(function(){
        var ckdlist = [];
        $('table tbody input[type="checkbox"]').each(function(){
            if($(this).prop("checked")){
                let id=$(this).closest("td").siblings("td").last().find("input").val();
                ckdlist.push(id);
            }
        });
        $("#deleteEmployeeModal #id").val(ckdlist.toString());
    })

    //edit one
    $(".edit").click(function(){
        var editid=$(this).prevAll("input").val();
        var uri=window.location.pathname;
        $.ajax({
            type:"Get",
            url:uri+"/rest/find/"+editid,
            success:function(mevent){
                $("#editEmployeeModal #ide").val(mevent.meventid);
                $("#editEmployeeModal #title").val(mevent.meventtitle);
                $("#editEmployeeModal #namee").val(mevent.meventname);
                $("#editEmployeeModal #typeid").val(mevent.meventtypeid);
                $("#editEmployeeModal #startdate").val(mevent.meventstartdate.substring(0,10));
                $("#editEmployeeModal #starttime").val(mevent.meventstartdate.substr(11));
                $("#editEmployeeModal #enddate").val(mevent.meventenddate.substring(0,10));
                $("#editEmployeeModal #endtime").val(mevent.meventenddate.substr(11));
                $("#editEmployeeModal #description").text(mevent.meventdescription);
                if(mevent.meventpicture===null){   
                    $("#editEmployeeModal #img0e").removeAttr("src");             
                }else{
                $("#editEmployeeModal #img0e").attr("src","data:image/jpg;base64,"+mevent.meventpicture);
                $("#editEmployeeModal #img0e").attr("width","600px");
                }
                $("#editEmployeeModal #ownerid").val(mevent.meventownerid);
            }
        })
    });
});