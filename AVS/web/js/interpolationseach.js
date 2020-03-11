var initArray = [9, 8, 7, 6, 9, 4, 3, 2, 1, 1];
//export var initArray = [9, 8, 7, 6, 9, 4, 3, 2, 1, 1];
var gapbetweennumber = 10;
var N = 10; // Array Size
var XYs = 5; // Element Visual Size
var Xp = 1; // Start Pos X
var Yp = 1; // Start Pos Y
var canvas;
var currentstep = 0;
var totalstep;

var run;
var boolRun = true;
var arr_by_user = [];
var speed = 1000;
var eachStepArr = [];
var highlightcheck = [];
var highlightcode = [];
var highlightsorted = [];
var color = [];
//window.init = init;
//window.shuffle = shuffle;
//window.initArray = initArray;
//window.next = next;
//window.back = back;
//window.resume = resume;

function init() {
    /* var mydata = JSON.stringify(initArray);
    console.log("datanormal: " + initArray);
    $.ajax({
        type: "POST",
        url: "../SortStepServlet",
        data: {name: mydata}
        ,
        dataType: "json",
        //OK
        success: function (data) {
            console.log(data);
            drawGraph(data);
        }
        ,
        error: function (error) {
            console.log("error", error);
        }
    }
    ); */
    
    selectionSort(initArray);    
    currentstep = -1;
    canvas = document.getElementById('canvasAnimation');
    draw(0);
    if (boolRun) {
        clearInterval(run);
        loadingAnimation();
    }
//    boolRun = true;
//    resume();

}

function interpolationsearch(array,searchvalue) {
    var temparray = newarray(array);
    // Find indexes of two corners 
        var low = 0, high = (temparray.length - 1);       
        // Since array is sorted, an element present 
        // in array must be in range defined by corner 
        while (low <= high && searchvalue >= temparray[low] && searchvalue <= temparray[high]) 
        {         
  
            if (low === high) 
            { 
                if (temparray[low] === searchvalue) return low; 
                return -1; 
            }          
            // Probing the position with keeping 
            // uniform distribution in mind.        
            var pos = low + (((high-low) /(temparray[high]-temparray[low]))*(searchvalue - temparray[low])); 
       
            // Condition of target found 
            if (temparray[pos] === searchvalue) 
                return pos;        
            // If x is larger, x is in upper part 
            if (temparray[pos] < searchvalue) {
                low = pos + 1; 
            }
            // If x is smaller, x is in the lower part 
            else {
                high = pos - 1; 
            }
        } 
        return -1; 
}
/*
function selectionSort(array) {
    var temparray = newarray(array);
    var count = 0;
    //init arrays
    eachStepArr = [];
    highlightcheck = [];
    highlightsorted = [];
    color = [];
    highlightcode = [];

    //first elements
    eachStepArr.push(newarray(temparray));
    highlightcheck.push(0);
    color.push(0);
    highlightcode.push(1);
    highlightsorted.push(null);

    for (var i = 0; i < temparray.length - 1; i++) {
        var index = i;
        eachStepArr.push(newarray(temparray));
        highlightcheck.push(i);
        color.push(0);
        highlightcode.push(2);
        highlightsorted.push([i]);
        for (var j = i + 1; j < temparray.length; j++) {
            eachStepArr.push(newarray(temparray));
            highlightcheck.push([j]);
            color.push("check");
            highlightcode.push(3);
            highlightsorted.push([i]);
            if (temparray[j] < temparray[index]) {
                index = j;
                eachStepArr.push(newarray(temparray));
                highlightcheck.push([j]);
                color.push("swap");
                highlightcode.push(5);
                highlightsorted.push([i]);
            }
        }
        var smallerNumber = temparray[index];
        temparray[index] = temparray[i];
        temparray[i] = smallerNumber;
        eachStepArr.push(newarray(temparray));
        highlightcheck.push([i,index]);
        color.push("swap");
        highlightcode.push(8);
        highlightsorted.push([i]);
    }
    //last elements
    highlightcode.push(9);
    eachStepArr.push(newarray(temparray));
    totalstep = eachStepArr.length - 1;
    highlightsorted.push(newsortedarray(initArray.length));

    //set step in userview
    document.getElementById("txtStepcount").innerHTML = '' + (currentstep + 1) + "/" + (totalstep + 1);
    document.getElementById("progressStep").max = eachStepArr.length - 1;
    document.getElementById("slideStep").max = eachStepArr.length - 1;

}
*/
function shuffle() {
    var oldPos = initArray.length,
            newPos, temp;
    while (--oldPos) {
        newPos = Math.floor(Math.random() * (oldPos + 1));
        temp = initArray[oldPos];
        initArray[oldPos] = initArray[newPos];
        initArray[newPos] = temp;
    }
    init();
}

function integerArray(stringArr) {
    var intArr = [];
    for (var i = 0; i < stringArr.length; i++) {
        //if check ma la co ki tu khong phai so
        if (!isNormalInteger(stringArr[i])) {
            //hien ra alert() len trang index

            return null;
        }
        //neu khong thi xay dung ra mot cai mang     
        else {
            number = parseInt(stringArr[i]);
            intArr.push(number);
        }
    }

    return intArr;
}

function inputByUser() {
    arr_by_user = document.getElementById("txtElement").value;
    arr_by_user = arr_by_user.split(',');
    if (integerArray(arr_by_user) !== null) {
        initArray = integerArray(arr_by_user);
    }
    init();
}



function next() {
    clearInterval(run);
    if (currentstep < eachStepArr.length - 1) {
        currentstep++;
        draw(currentstep);
    }
    boolRun = false;
    document.getElementById("PauseOrCon").value = 'Play';
}

function isNormalInteger(str) {
    return /^\+?(0|[1-9]\d*)$/.test(str);
}

function chooseStep() {
    currentstep = parseInt(document.getElementById("slideStep").value);
    draw(currentstep);
}

function back() {
    //mang da chay dc it nhat 2 phan tu
    if (currentstep >= 1) {
        clearInterval(run);
        currentstep--;
        draw(currentstep);
    }
    boolRun = false;
    document.getElementById("PauseOrCon").value = 'Play';
}

function resume() {
    if (boolRun) {
        //đang trong trạng thái chạy
        clearInterval(run);
        document.getElementById("PauseOrCon").value = 'Play';
        boolRun = false;
    } else {
        //đang trong trạng thái pause
        clearInterval(run);
        document.getElementById("PauseOrCon").value = 'Pause';
        boolRun = true;
        run = setTimeout(loadingAnimation, speed);
    }
}

//hien thi ve
function loadingAnimation() {
    //check de cho phep load tiep hay ko
    if (currentstep < eachStepArr.length - 1) {
        currentstep++;
        draw(currentstep);
    }
    run = setTimeout(loadingAnimation, speed);
}

/*
function draw(step) {

    if (canvas.getContext) {
        var ctx = canvas.getContext('2d');
        var canvasheight = parseInt(document.getElementById("canvasAnimation").height);
        var canvaswidth = parseInt(document.getElementById("canvasAnimation").width);
        //xóa draw cũ
        ctx.fillStyle = "#FFFFFF";
        ctx.fillRect(0, 0, canvaswidth, canvasheight);

        //vẽ mảng của step hiện tại
        drawInitCurrent(step, ctx);
        
        //highlightsorted
        drawHighlightSorted(step, ctx);

        //highlight
        drawHighlightAnimation(step, ctx);

        

        //highlightcode
        highlightCode(step);



    }
    if (step === totalstep) {
        document.getElementById("btnNext").disabled = true;
    } else {
        document.getElementById("btnNext").disabled = false;
    }
    if (step <= 0) {
        document.getElementById("btnPrev").disabled = true;
    } else {
        document.getElementById("btnPrev").disabled = false;

    }
    if (step > 0) {
        document.getElementById("txtStepcount").innerHTML = '' + (step + 1) + "/ " + (totalstep + 1);
    } else {
        document.getElementById("txtStepcount").innerHTML = '' + 1 + "/ " + (totalstep + 1);
    }
    document.getElementById("progressStep").value = step;
    document.getElementById("slideStep").value = step;
}

function drawInitCurrent(currentstep, ctx) {
    for (var i = 0; i < eachStepArr[currentstep].length; i++) {
        ctx.fillStyle = "#AAAAAA";
        ctx.fillRect((Xp * i * gapbetweennumber) * XYs, Yp * XYs * 5 - 20, 30, 30);
        ctx.fillStyle = "#000000";
        ctx.fillText(eachStepArr[currentstep][i], (Xp * i * gapbetweennumber) * XYs + 10, Yp * XYs * 5, 60);
        if (highlightcode[i] !== 0) {
            var line_name = "line_" + highlightcode[i];
            document.getElementById(line_name).style.background = "None";
        }
    }
}

function drawHighlightAnimation(currentstep, ctx) {
    for (var i = 0; i < eachStepArr[currentstep].length; i++) {
        if (currentstep !== 0 && currentstep !== eachStepArr.length - 1) {
            for (var j = 0; j < highlightcheck[currentstep].length; j++) {
                if (highlightcheck[currentstep][j] === i) {
                    if (color[currentstep] === "swap") {
                        ctx.fillStyle = "#c51162";
                        ctx.fillRect((Xp * i * gapbetweennumber) * XYs, Yp * XYs * 5 - 20, 30, 30);
                        ctx.fillStyle = "#000000";
                        ctx.fillText(eachStepArr[currentstep][i], (Xp * i * gapbetweennumber) * XYs + 10, Yp * XYs * 5, 60);
                    } else {
                        ctx.fillStyle = "#2962ff";
                        ctx.fillRect((Xp * i * gapbetweennumber) * XYs, Yp * XYs * 5 - 20, 30, 30);
                        ctx.fillStyle = "#000000";
                        ctx.fillText(eachStepArr[currentstep][i], (Xp * i * gapbetweennumber) * XYs + 10, Yp * XYs * 5, 60);
                    }
                }
            }

        }
    }
}

function drawHighlightSorted(currentstep, ctx) {
    for (var i = 0; i < eachStepArr[currentstep].length; i++) {
        if (currentstep !== 0 && highlightsorted[currentstep] !== null) {
            for (var j = 0; j < highlightsorted[currentstep].length; j++) {
                if (highlightsorted[currentstep][j] === i) {
                    ctx.fillStyle = "Green";
                    ctx.fillRect((Xp * i * gapbetweennumber) * XYs, Yp * XYs * 5 - 20, 30, 30);
                    ctx.fillStyle = "#000000";
                    ctx.fillText(eachStepArr[currentstep][i], (Xp * i * gapbetweennumber) * XYs + 10, Yp * XYs * 5, 60);
                }
            }

        }
    }
}

function highlightCode(currentstep) {
    //khởi tạo lại
    highlightcode.forEach(function (item) {
        if (item !== 0) {
            var line_name = "line_" + item;
            document.getElementById(line_name).style.background = "None";
        }
    });
    //hightlightcode 
    if (highlightcode[currentstep] !== 0) {
        var line_name = "line_" + highlightcode[currentstep];
        document.getElementById(line_name).style.background = "Red";
    }
}

*/
function newarray(array) {
    var tempwarray = [];
    array.forEach(function (item) {
        tempwarray.push(item);
    });

    return tempwarray;
}

function newsortedarray(sorted) {
    var tempwarray = [];
    for (var i = sorted; i > 0; i--) {
        tempwarray.push(initArray.length - i);
    }
    return newarray(tempwarray);
}



//chinh speed khi user giu con tro chuot
function changeSpeed() {
    speed = 1000 / (parseInt(document.getElementById("rangebar").value));

}

//chưa sửa được lỗi


function drawGraph(data) {
    var canvas = document.getElementById("canvasGraph");
    context = canvas.getContext("2d");
    //set background_color for graph
    context.fillStyle = "pink";
    context.fillRect(0, 0, canvas.width, canvas.height);

    var canvas_height = canvas.height;//chieu cao canvas
    var canvas_width = canvas.width; // chieu rong canvas

    var vertical_gap_top = 20;
    var vertical_gap_bot = 20;

    var biggest_value_of_array = Math.max.apply(Math, data.map(function (o) {
        return o.number_of_step;
    }));


    var numberdigits = Math.floor(Math.log10(Math.abs(biggest_value_of_array))) + 1;
    var constant = Math.pow(10, numberdigits - 1); // cai z cua Mạnh
    var vertical_axis_top_value = (parseInt(biggest_value_of_array / constant) + 1) * constant;
        
    function pixcelLengthOfValue(value) {
         return context.measureText(value).width;
    }
    
    //chỗ này t chưa tìm được tên phù hợp cho biến
    var left = 10;
    var center = left + pixcelLengthOfValue(vertical_axis_top_value);// vi tri viet gia tri tren Oy
    var right = 5;
    var root_cordinate_pos = center - context.measureText("0").width;

    var horizon_gap_left = left + center + right;
    var horizon_gap_right = 20;

    var vertical_axis_name = 'number of steps';
    var margin_left = 20;
    var margin_right = 20;
    var margin_top_collumn = 10;
    var horizon_axis = canvas_width - (horizon_gap_left + horizon_gap_right);// truc ox
    var vertical_axis = canvas_height - (vertical_gap_bot + vertical_gap_top);// truc oy

    var next_col_cordinate_pos = 0;
    var length_arrow = 5;

    var colum_width = 30;
    var realLength = horizon_axis - (margin_left + margin_right);// chieu dai tu bat dau cot nay toi ket thuc cot cuoi 
    var gap_between_col = (realLength - (colum_width * data.length)) / (data.length - 1);

    //draw colum
    var start_col_pos = horizon_gap_left + margin_left;

    function endPos(stepValue) {
        return vertical_gap_top + vertical_axis - colHeight(stepValue);
    }
    var distance_arrow_to_underline = 20;
    var color_red_value = 10;
    var green = 10;
    var blue = 100;

    //draw Oxy axys 
    context.beginPath();
   // context.fillStyle = "black";
   //  context.font = "19 pt Arial;";

    //Viết tên của trục Oy
    context.fillText(vertical_axis_name, margin_left, vertical_gap_top - margin_top_collumn);
    //draw Oy and arrow        
    context.moveTo(horizon_gap_left, vertical_axis + vertical_gap_top);
    context.lineTo(horizon_gap_left, vertical_gap_top);
    context.lineTo(horizon_gap_left + length_arrow, vertical_gap_top + length_arrow);
    context.moveTo(horizon_gap_left, vertical_gap_top);
    context.lineTo(horizon_gap_left - length_arrow, vertical_gap_top + length_arrow);
    //draw Ox
    context.moveTo(horizon_gap_left, vertical_axis + vertical_gap_top);
    context.lineTo(horizon_axis + horizon_gap_left, vertical_axis + vertical_gap_top);
    context.stroke();


    //write Oy value
    function writeVerticalAxisValue(headerValue, horCor, verCor) {
        context.fillStyle = "black";
        context.font = "19 pt Arial;";
        context.fillText(headerValue, horCor, verCor);
    }
    //return height of each column
    function colHeight(step) {
        return parseInt(((vertical_axis - distance_arrow_to_underline) * step) / vertical_axis_top_value);
    }
    // write the number step in the top of each column
    function fillColHeader(headerValue, horCor, verCor) {
        context.fillStyle = "black";
        context.font = "19 pt Arial;";
        var lengthtemp = context.measureText(headerValue).width;
        context.fillText(headerValue, horCor + (colum_width / 2) - (lengthtemp / 2), verCor);
    }

    //var underline_length = 5;
    var number_of_underline = 5;
    var next_underline_pos = 0;

    var underline_value = vertical_axis_top_value;

    //bat dau lien quan toi horizon left

    //ve gia tri tung muc cua Oy        
    context.beginPath();
    for (var i = 0; i <= number_of_underline; i++) {
        //vẽ giá trị cao nhất của trục Oy
        if (i === 0) {
            context.moveTo(horizon_gap_left - right, vertical_gap_top + distance_arrow_to_underline);
            context.lineTo(horizon_gap_left + right, vertical_gap_top + distance_arrow_to_underline);
            writeVerticalAxisValue(underline_value, center - pixcelLengthOfValue(underline_value), vertical_gap_top + distance_arrow_to_underline);
        }
        else if (i > 0 && i <= number_of_underline - 2) {
            context.moveTo(horizon_gap_left - right, vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
            context.lineTo(horizon_gap_left + right, vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
            writeVerticalAxisValue(underline_value, center - pixcelLengthOfValue(underline_value), vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
        } //viết ra số ở ngay trên số 0 gốc toạ độ
        else if (i === number_of_underline - 1) {
            context.moveTo(horizon_gap_left - right, vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
            context.lineTo(horizon_gap_left + right, vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
            writeVerticalAxisValue(underline_value, center - pixcelLengthOfValue(underline_value), vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
        }//vẽ số 0 gốc toạ độ
        else {
            writeVerticalAxisValue(0, root_cordinate_pos, vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
        }
        next_underline_pos += (vertical_axis - distance_arrow_to_underline) / number_of_underline;
        underline_value -= (vertical_axis_top_value / number_of_underline);
    }
    context.stroke();

    //set lai gia tri ve nhu cu cho no
    //number_of_underline = 5;
   // next_underline_pos = 0;
    //vẽ nét đứt
   /* 
    context.beginPath();
    for (var i = 0; i < number_of_underline; i++) {
        context.setLineDash([5, 15]);
        if (i === 0) {
            //ve hang net dut
            context.moveTo(horizon_gap_left + right, vertical_gap_top + distance_arrow_to_underline);
            context.lineTo(canvas_width - horizon_gap_right, vertical_gap_top + distance_arrow_to_underline);

        } else if (i > 0 && i <= number_of_underline - 2) {

            context.moveTo(horizon_gap_left + right, vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
            context.lineTo(canvas_width - horizon_gap_right, vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
        } else {
            context.moveTo(horizon_gap_left + right, vertical_gap_top + distance_arrow_to_underline + next_underline_pos);
            context.lineTo(canvas_width - horizon_gap_right, vertical_gap_top + distance_arrow_to_underline + next_underline_pos);

        }
        next_underline_pos += (vertical_axis - distance_arrow_to_underline) / number_of_underline;
        underline_value -= (vertical_axis_top_value / number_of_underline);
    }
    context.stroke();
*/

    //draw each collum
    for (i = 0; i < data.length; i++) {
        //set color for each collum       
        var color = "rgb(" + i + color_red_value + "," + green + "," + blue + ")";
        context.fillStyle = color;
        if (i === 0) {
            context.fillRect(start_col_pos, endPos((data[i].number_of_step)), colum_width, colHeight(data[i].number_of_step));
            fillColHeader(data[i].number_of_step, start_col_pos, endPos((data[i].number_of_step)) - margin_top_collumn);
        }

        if (i > 0 && i < data.length - 1) {
            context.fillRect(start_col_pos + next_col_cordinate_pos, endPos((data[i].number_of_step)), colum_width, colHeight(data[i].number_of_step));
            fillColHeader(data[i].number_of_step, start_col_pos + next_col_cordinate_pos, endPos((data[i].number_of_step)) - margin_top_collumn);
        }
        //vong cuoi
        if (i === data.length - 1) {
            context.fillRect(start_col_pos + next_col_cordinate_pos, endPos((data[i].number_of_step)), colum_width, colHeight(data[i].number_of_step));
            fillColHeader(data[i].number_of_step, start_col_pos + next_col_cordinate_pos, endPos((data[i].number_of_step)) - margin_top_collumn);
            break;
        }
        next_col_cordinate_pos += colum_width + gap_between_col;
    }
}


function setInputFilter(textbox, inputFilter) {
    ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function (event) {
        textbox.addEventListener(event, function () {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            } else {
                this.value = "";
            }
        });
    });
}




/*setInputFilter(document.getElementById("intLimitTextBox"), function(value) {
 return /^\d*$/.test(value) && (value === "" ||( parseInt(value) >=1 && parseInt(value) <= mang.length)); });*/
setInputFilter(document.getElementById("intLimitTextBox"), function (value) {
    return /^(\d+[, ]+)*$/.test(value);
});






