import datetime
from Artapp.models import *
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.


# LOGIN
def loginn(request):
    return render(request, 'admin/login_index.html')


def loginpost(request):
    var1 = request.POST['username']
    var2 = request.POST['password']

    res = login.objects.filter(username=var1, password=var2)

    if res.exists():
        obj = login.objects.get(username=var1, password=var2)
        request.session['lid'] = obj.id

        if obj.usertype == 'admin':
            return redirect('/admin_home/')

        elif obj.usertype == 'artist':
            return redirect('/artist_home/')

        elif obj.usertype == 'deliveryboy':
            return redirect('/deliveryboy_home')

        elif obj.usertype == 'user':
            return redirect('/user_home/')
        else:
            return HttpResponse('ok')
    else:
        return HttpResponse("<script>alert('no user found');window.location='/login/'</script>")


# ARTIST SIGNUP
def add_artist(request):
    res = artist.objects.all()
    re = category.objects.all()
    return render(request, 'Artist/signup.html', {'data8': re, 'data':res})


def add_artistp(request):
    var1 = request.POST['fname']
    var2 = request.POST['lname']
    var3 = request.POST['email']
    var4 = request.FILES['pic']
    var5 = request.POST['dob']
    var6 = request.POST['gender']
    var7 = request.POST['phone']


    drp = request.POST['dropdown']
    fs = FileSystemStorage()
    date = datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
    fn = fs.save(date, var4)


    lobj = login()
    lobj.username = var1
    lobj.password = var2
    lobj.usertype = 'artist'
    lobj.save()

    obj = artist()
    obj.Firstname = var1
    obj.Lastname = var2
    obj.email = var3
    obj.photo = fs.url(date)
    obj.dob = var5
    obj.gender = var6
    obj.phone = var7


    obj.CATEGORY_id = drp
    obj.LOGIN_id = lobj.id
    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/add_artist/'</script>")


# CHANGE PASSWORD ADMIN
def changepass_admin(request):
    return render(request, 'admin/changepass_admin.html')


def changepass_adminp(request):
    var1 = request.POST['cpass']
    var2 = request.POST['npass']
    var3 = request.POST['cnpass']
    res = login.objects.filter(id=request.session['lid'], password=var1)
    if res.exists():
        if var2 == var3:
            obj = login.objects.filter(id=request.session['lid']).update(password=var2)
            return HttpResponse("<script>alert('changed');window.location='/login/'</script>")
        else:
            return HttpResponse("<script>alert('error');window.location='/cpadmin/'</script>")
    else:
        return HttpResponse("<script>alert('error');window.location='/cpadmin/'</script>")


# ADMIN HOME
def admin_home(request):
    return render(request, 'admin/admin_home.html')



# VIEW ARTIST
def view_artist(request):
    res = artist.objects.all()
    return render(request, 'admin/View_artist.html' ,{'data': res})


# ARTIST HOME
def artist_home(request):
    return render(request, 'Artist/artist_home.html')


# CHANGE PASSWORD ARTIST
def changepass_artist(request):
    return render(request, 'Artist/changepass_artist.html')


def changepass_artistp(request):
    var1 = request.POST['cpass']
    var2 = request.POST['npass']
    var3 = request.POST['cnpass']
    res = login.objects.filter(id=request.session['lid'], password=var1)
    if res.exists():
        if var2 == var3:
            obj = login.objects.filter(id=request.session['lid']).update(password=var2)
            return HttpResponse("<script>alert('changed');window.location='/login/'</script>")
        else:
            return HttpResponse("<script>alert('error');window.location='/cpa/'</script>")
    else:
        return HttpResponse("<script>alert('error');window.location='/cpa/'</script>")



# VIEW PROFILE ARTIST
def viewprofile_artist(request):
    res = artist.objects.filter(LOGIN_id=request.session['lid'])
    return render(request, 'Artist/view_profileartist.html', {'data': res})


# EDIT ARTIST PROFLE
def editprofile_artist(request,kk):
    res = artist.objects.get(id=kk)
    re = category.objects.all()
    return render(request, 'Artist/edit_artist_profile.html', {'data': res, 'data8': re})


def editprofile_artistp(request):
    var1 = request.POST['fname']
    var2 = request.POST['lname']
    var3 = request.POST['email']
    var4 = request.POST['dob']
    var5 = request.POST['gender']
    var6 = request.POST['phone']
    kk = request.POST['id9']
    var7 = request.POST['dropdown']


    obj = artist.objects.get(id=kk)
    if 'pic' in request.FILES:
        var8 = request.FILES['pic']
        fs = FileSystemStorage()
        date = datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
        fn = fs.save(date, var8)
        obj.photo = fs.url(date)

    obj.Firstname = var1
    obj.Lastname = var2
    obj.email = var3
    obj.dob = var4
    obj.gender = var5
    obj.phone = var6
    obj.CATEGORY_id = var7
    obj.save()
    return HttpResponse("<script>alert('Updated');window.location='/view_artist/'</script>")


# ADD CATEGORY
def add_category(request):
    obj = category.objects.all()
    return render(request, 'admin/add_category.html', {'data': obj})

def add_categoryp(request):
    var1 = request.POST['category']

    obj = category()
    obj.category_name = var1
    obj.save()
    return HttpResponse("<script>alert('Added');window.location='/add_cat/'</script>")


# VIEW CATEGORY
def view_category(request):
    res = category.objects.all()
    return render(request, 'admin/view_category.html', {'data': res})



# DELETE ARTIST(ADMIN)
def delete_artist(request, kk):
    res = artist.objects.get(id=kk).delete()
    return redirect('/view_artist/', {'data': res})



# USER REGISTRATION
def user_reg(request):
    res = user.objects.all()
    return render(request, 'User/user_reg.html', {'data': res})

def user_regp(request):
    var1 = request.POST['fname']
    var2 = request.POST['lname']
    var3 = request.POST['email']
    var4 = request.POST['dob']
    var5 = request.POST['gender']
    var6 = request.POST['phone']
    var7 = request.FILES['pic']

    fs = FileSystemStorage()
    date = datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
    fn = fs.save(date, var7)

    lobj = login()
    lobj.username = var1
    lobj.password = var2
    lobj.usertype = 'user'
    lobj.save()


    obj = user()
    obj.Firstname = var1
    obj.Lastname = var2
    obj.email = var3
    obj.photo = fs.url(date)
    obj.dob = var4
    obj.gender = var5
    obj.phone = var6
    obj.LOGIN_id=lobj.id
    obj.save()
    return HttpResponse("<script>alert('Added');window.location='/user_reg/'</script>")



# USER HOME
def user_home(request):
    return render(request,'User/user_home.html')


# VIEW USER(ADMIN)
def view_user(request):
    res = user.objects.all()
    return render(request, 'admin/view_user.html', {'data': res})


# DELETE USER(ADMIN)
def delete_user(request, kk):
    res = user.objects.get(id=kk).delete()
    return redirect('/view_user/', {'data': res})


# VIEW PROFILE USER
def viewprofile_user(request):
    res = user.objects.filter(LOGIN_id=request.session['lid'])
    return render(request, 'User/view_profileuser.html', {'data': res})



# EDIT USER PROFILE
def editprofile_user(request, kk):
    res = user.objects.get(id=kk)
    return render(request, 'User/edit_userprofile.html', {'data': res})


def editprofile_userp(request):
    var1 = request.POST['fname']
    var2 = request.POST['lname']
    var3 = request.POST['email']
    var5 = request.POST['dob']
    var6 = request.POST['gender']
    var7 = request.POST['phone']
    kk   = request.POST['id8']


    obj = user.objects.get(id=kk)
    if 'pic' in request.FILES:
        var4 = request.FILES['pic']
        fs = FileSystemStorage()
        date = datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
        fn = fs.save(date, var4)
        obj.photo = fs.url(date)


    obj.Firstname = var1
    obj.Lastname = var2
    obj.email = var3
    obj.dob = var5
    obj.gender = var6
    obj.phone = var7
    obj.save()
    return HttpResponse("<script>alert('Updated');window.location='/view_user/'</script>")


# CHANGE PASSWORD USER
def changepass_user(request):
    return render(request, 'User/Changepass_user.html')


def changepass_userp(request):
    var1 = request.POST['cpass']
    var2 = request.POST['npass']
    var3 = request.POST['cnpass']
    res = login.objects.filter(id=request.session['lid'], password=var1)
    if res.exists():
        if var2 == var3:
            obj = login.objects.filter(id=request.session['lid']).update(password=var2)
            return HttpResponse("<script>alert('changed');window.location='/login/'</script>")
        else:
            return HttpResponse("<script>alert('error');window.location='/cpu/'</script>")
    else:
        return HttpResponse("<script>alert('error');window.location='/cpu/'</script>")


# LIVE CHAT
def home(request):
    return render(request, '../../Artconnect/templates/User/home.html')

def room(request, room):
    username = request.GET.get('username')
    room_details = Room.objects.get(name=room)
    return render(request, '../../Artconnect/templates/User/room.html', {
        'username': username,
        'room': room,
        'room_details': room_details
    })

def checkview(request):
    room = request.POST['room_name']
    username = request.POST['username']

    if Room.objects.filter(name=room).exists():
        return redirect('/'+room+'/?username='+username)
    else:
        new_room = Room.objects.create(name=room)
        new_room.save()
        return redirect('/'+room+'/?username='+username)

def send(request):
    message = request.POST['message']
    username = request.POST['username']
    room_id = request.POST['room_id']

    new_message = Message.objects.create(value=message, user=username, room=room_id)
    new_message.save()
    return HttpResponse('Message sent successfully')

def getMessages(request, room):
    room_details = Room.objects.get(name=room)

    messages = Message.objects.filter(room=room_details.id)
    return JsonResponse({"messages":list(messages.values())})


# DELIVERY BOY REGISTRATION
def add_deliveryboy(request):
    res = deliveryboy.objects.all()
    return render(request, 'Deliveryboy/deliveryboy_signup.html', {'data':res})


def add_deliveryboyp(request):
    var1 = request.POST['fname']
    var2 = request.POST['lname']
    var3 = request.POST['email']
    var4 = request.POST['location']
    var5 = request.POST['dob']
    var6 = request.POST['gender']
    var7 = request.POST['phone']


    lobj = login()
    lobj.username = var1
    lobj.password = var2
    lobj.usertype = 'deliveryboy'
    lobj.save()

    obj = deliveryboy()
    obj.Firstname = var1
    obj.Lastname = var2
    obj.email = var3
    obj.location = var4
    obj.dob = var5
    obj.gender = var6
    obj.phone = var7


    obj.LOGIN_id = lobj.id
    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/add_deliveryboy'</script>")


# VIEW DELIVERY BOY(ADMIN)
def view_deliveryboy(request):
    res = deliveryboy.objects.all()
    return render(request, 'admin/view_deliveryboy.html', {'data': res})



# DELETE DELIVERY BOY(ADMIN)
def delete_deliveryboy(request, kk):
    res = deliveryboy.objects.get(id=kk).delete()
    return redirect('/view_deliveryboy', {'data': res})


# DELIVERY BOY HOME
def deliveryboy_home(request):
    return render(request, 'Deliveryboy/Deliveryboy_home.html')


# VIEW PROFILE DELIVERY BOY
def viewprofile_deliveryboy(request):
    res = deliveryboy.objects.filter(LOGIN_id=request.session['lid'])
    return render(request, 'Deliveryboy/viewprofile_deliveryboy.html', {'data2': res})



# EDIT PROFILE DELIVERY BOY
def editprofile_deliveryboy(request, kk):
    res = deliveryboy.objects.get(id=kk)
    return render(request, 'Deliveryboy/editprofile_deliveryboy.html', {'data': res})


def editprofile_deliveryboyp(request):
    var1 = request.POST['fname']
    var2 = request.POST['lname']
    var3 = request.POST['email']
    var4 = request.POST['dob']
    var5 = request.POST['gender']
    var6 = request.POST['location']
    var7 = request.POST['phone']
    kk   = request.POST['id9']


    obj = deliveryboy.objects.get(id=kk)

    obj.Firstname = var1
    obj.Lastname = var2
    obj.email = var3
    obj.dob = var4
    obj.gender = var5
    obj.location = var6
    obj.phone = var7
    obj.save()
    return HttpResponse("<script>alert('Updated');window.location='/view_deliveryboy'</script>")




# CHANGE PASSWORD DELIVERY BOY
def changepass_deliveryboy(request):
    return render(request, 'Deliveryboy/changepass_deliveryboy.html')


def changepass_deliveryboyp(request):
    var1 = request.POST['cpass']
    var2 = request.POST['npass']
    var3 = request.POST['cnpass']
    res = login.objects.filter(id=request.session['lid'], password=var1)
    if res.exists():
        if var2 == var3:
            obj = login.objects.filter(id=request.session['lid']).update(password=var2)
            return HttpResponse("<script>alert('changed');window.location='/login/'</script>")
        else:
            return HttpResponse("<script>alert('error');window.location='/cpd'</script>")
    else:
        return HttpResponse("<script>alert('error');window.location='/cpd'</script>")



# ADD PRODUCT ARTIST
def add_product(request):
    return render(request, 'Artist/add_product.html')


def add_productp(request):
    var1 = request.POST['pname']
    var2 = request.POST['description']
    var3 = request.POST['price']
    var4 = request.FILES['pic']

    fs = FileSystemStorage()
    date = datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
    fn = fs.save(date, var4)


    obj = product()
    obj.name = var1
    obj.description = var2
    obj.price = var3
    obj.image = fs.url(date)
    rid=artist.objects.get(LOGIN=request.session['lid'])
    obj.ARTIST_id  = rid.id
    obj.save()
    return HttpResponse("<script>alert('Added');window.location='/addproduct'</script>")


# VIEW PRODUCT
def view_product(request):
    res = product.objects.filter(ARTIST__LOGIN_id=request.session['lid'])
    # res = product.objects.all()
    return render(request, 'Artist/view_product.html', {'data7': res})


# EDIT PRODUCT
def edit_product(request,kk):
    res = product.objects.get(id=kk)
    return render(request, 'Artist/edit_product.html', {'data': res})


def editproductp(request):
    var1 = request.POST['pname']
    var2 = request.POST['description']
    var3 = request.POST['price']
    kk   = request.POST['id5']


    obj = product.objects.get(id=kk)

    if 'pic' in request.FILES:
        var4 = request.FILES['pic']
        fs = FileSystemStorage()
        date = datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
        fn = fs.save(date, var4)
        obj.image = fs.url(date)


    obj.name = var1
    obj.description = var2
    obj.price = var3
    obj.save()
    return HttpResponse("<script>alert('Edited');window.location='/vpr'</script>")



# DELETE PROODUCT
def delete_product(request, kk):
    res = product.objects.get(id=kk).delete()
    return redirect('/vpr', {'data': res})


# VIEW PRODUCT USER
def viewproduct_user(request):
    res = product.objects.all()
    re = artist.objects.all()
    return render(request, 'User/viewproduct_user.html', {'data7': res, 'data': re})


# PURCHASE
def purchase(request):
    res = product.objects.all()
    ree = artist.objects.all()
    return render(request, 'User/purchase.html', {'data': res, 'data2': ree})

def purchasep(request):
    var1 = request.POST['price']
    var2 = request.POST['quantity']
    var3 = request.POST['date']
    var4 = request.POST['address']
    var5 = request.POST['cardno']
    var6 = request.POST['expd']
    var7 = request.POST['cvv']


    drp = request.POST['product']
    drp2 = request.POST['artist']
    obj = Purchase()
    obj.price = var1
    obj.quantity = var2
    obj.purchase_date = var3
    obj.address = var4
    obj.card_number = var5
    obj.expiration_date = var6
    obj.cvv = var7
    obj.PRODUCT_id = drp
    uid=user.objects.get(LOGIN=request.session['lid'])
    obj.BUYER_id = uid.id
    obj.ARTIST_id = drp2
    obj.save()
    return HttpResponse("<script>alert('Payment Completed Successfully');window.location='/purchase'</script>")



# VIEW PURCHASE
def view_purchase(request):
    res = product.objects.all()
    re  = Purchase.objects.filter(status="pending")
    ree = user.objects.all()
    return render(request, 'Deliveryboy/view_purchase.html', {'dataa': res, 'data': re, 'data1': ree})

def view_delivered(request):
    res = product.objects.all()
    re = Purchase.objects.filter(status="Delivered")
    ree = user.objects.all()
    return render(request, 'Deliveryboy/view_delivered product.html', {'dataa': res, 'data': re, 'data1': ree})



# VIEW PAYMENT DETAILS
def view_payment(request):
    res = product.objects.all()
    re = Purchase.objects.filter(ARTIST__LOGIN__id=request.session['lid'])
    ree = user.objects.all()
    return render(request, 'Artist/view_payment.html', {'dataa': res, 'data': re, 'data1': ree})



# DELIVERY STATUS
def delivery_status(request):
    res = Purchase.objects.all()
    return render(request, 'Deliveryboy/delivery_status.html', {'data': res})

def delivered(request, pk):
    res = Purchase.objects.filter(pk=pk).update(status = 'Delivered')
    return HttpResponse("<script>alert('Delivered');window.location='/viewpurchase'</script>")

def Pending(request, pk):
    res = Purchase.objects.filter(pk=pk).update(status = 'Pending')
    return HttpResponse("<script>alert('Pending');window.location='/viewpurchase'</script>")



# VIEW PURCHASE USER
def viewpu_user(request):
    res = product.objects.all()
    re = Purchase.objects.filter(BUYER__LOGIN__id=request.session['lid'], status="Delivered")
    ree = user.objects.all()
    return render(request, 'User/viewpurchase_user.html', {'dataa': res, 'data': re, 'data1': ree})



# VIEW DELIVERY STATUS(ARTIST)
def viewdelivery_status(request):
    res = Purchase.objects.filter(ARTIST__LOGIN__id=request.session['lid'])
    return render(request, 'Artist/viewdelivery_status.html', {'data': res})

# VIEW DELIVERY STATUS(USER)
def viewdeliverystatus_user(request):
    res = Purchase.objects.filter(BUYER__LOGIN__id=request.session['lid'])
    return render(request, 'User/viewdeliverystatus_user.html', {'data': res})


# SENT COMPLAINT
def sentcomp(request):
    res = complaint.objects.all()
    re = user.objects.all()
    return render(request, 'User/sent_complaint.html', {'data': res, 'data1': re})


def sentcompp(request):
    var1 = request.POST['complaint']
    from datetime import datetime
    td = datetime.now().strftime('%Y-%m-%d')
    lid = request.session['lid']

    uobj = user.objects.get(LOGIN_id=lid)

    obj = complaint()
    obj.complaint = var1
    obj.date = td
    obj.USER_id = uobj.id
    obj.status = 'pending'
    obj.save()
    return HttpResponse("<script>alert('Complaint sent Succesfully');window.location='/sentcomp'</script>")


# VIEW COMPLAINT(ADMIN)
def viewcomplaint(request):
    res = complaint.objects.all()
    re = user.objects.all()
    return render(request, 'admin/view complaint.html', {'data': res, 'data1': re})

# VIEW COMPLAINT(USER)
def viewcomp_user(request):
    res = complaint.objects.filter(USER__LOGIN__id=request.session['lid'])
    re = user.objects.all()
    return render(request, 'User/viewcomp_user.html', {'data': res, 'data1': re})


# SENT REPLY
def sentreply(request, pp):
    res = complaint.objects.get(id=pp)
    re = user.objects.all()
    return render(request, 'admin/sent_reply.html', {'data': res, 'dataa': re})


def sentreplyp(request):
    var1 = request.POST['reply']
    comid = request.POST['comid']

    cobj = complaint.objects.get(id=str(comid))
    cobj.reply = var1
    cobj.status = 'replied'
    cobj.save()
    return HttpResponse("<script>alert('Reply Sent');window.location='/viewcomp'</script>")


# VIEW REPLY
def viewrep(request):
    res = complaint.objects.filter(USER__LOGIN__id=request.session['lid'])
    re = user.objects.all()
    return render(request, 'User/viewreply_user.html', {'data': res, 'dataa': re})




# SENT FEEDBACK
def sentfeedback(request):
    res = Feedback.objects.all()
    re = user.objects.all()
    return render(request, 'User/sent_feedback.html', {'data': res, 'data1': re})


def sentfeedbackp(request):
    var1 = request.POST['feedback']
    from datetime import datetime
    td = datetime.now().strftime('%Y-%m-%d')
    lid = request.session['lid']

    uobj = user.objects.get(LOGIN_id=lid)

    obj = Feedback()
    obj.feedback = var1
    obj.date = td
    obj.USER_id = uobj.id
    obj.status = 'pending'
    obj.save()
    return HttpResponse("<script>alert('Feedback sent Succesfully');window.location='/sfdb'</script>")


# VIEW FEEDBACK (ADMIN)
def viewfeedback(request):
    res = Feedback.objects.all()
    re = user.objects.all()
    return render(request, 'admin/view_feedback.html',{'data': res, 'data1': re})



# SENT FEEDBACK REPLY(ADMIN)
def sentfeedback_reply(request, pp):
    res = Feedback.objects.get(id=pp)
    re = user.objects.all()
    return render(request, 'admin/sentreply_feedback.html', {'data': res, 'dataa': re})


def sentfeedback_replyp(request):
    var1 = request.POST['reply']
    fid = request.POST['fid']

    cobj = Feedback.objects.get(id=str(fid))
    cobj.reply = var1
    cobj.status = 'replied'
    cobj.save()
    return HttpResponse("<script>alert('Reply Sent');window.location='/viewfdbk'</script>")


# VIEW FEEDBACK RESPONSE(USER)
def viewfdbkresponse(request):
    res = Feedback.objects.filter(USER__LOGIN__id=request.session['lid'])
    re = user.objects.all()
    return render(request, 'User/viewfeedback_response.html', {'data': res, 'dataa':re})


# RATING
def rate_product(request):
    res = product.objects.all()
    res1 = artist.objects.all()
    re = user.objects.all()
    return render(request, 'User/rating.html', {'data8': res, 'data': res1, 'data1': re})


def rate_productp(request):
    var1 = request.POST['rating']
    var2 = request.POST['comment']
    from datetime import datetime
    td = datetime.now().strftime('%Y-%m-%d')
    lid = request.session['lid']



    drp = request.POST['artist']
    drp1 = request.POST['product']
    uobj = user.objects.get(LOGIN_id=lid)

    obj = rating()
    obj.rate = var1
    obj.comments = var2
    obj.date = td
    obj.ARTIST_id = drp
    obj.PRODUCT_id = drp1
    obj.USER_id = uobj.id
    obj.save()
    return HttpResponse("<script>alert('Rating Set ');window.location='/rating'</script>")



# VIEW RATING(ARTIST)
def view_rating(request):
    res = rating.objects.filter(ARTIST__LOGIN__id=request.session['lid'])
    re  = artist.objects.all()
    ree = user.objects.all()
    req = product.objects.all()
    return render(request, 'Artist/view_rating.html', {'data': res, 'data1': re, 'data2': ree, 'data3': req})


# VIEW RATING(USER)
def viewrating_user(request):
    res = rating.objects.all()
    re  = artist.objects.all()
    ree = user.objects.all()
    req = product.objects.all()
    return render(request, 'User/viewrating_user.html', {'data': res, 'data1': re, 'data2': ree, 'data3': req})


# DELETE CATEGORY
def dltcategory(request,kk):
    res = category.objects.get(id=kk).delete()
    return redirect('/view_category/', {'data': res})






