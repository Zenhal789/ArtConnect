from django.urls import path
from Artapp import views


urlpatterns =[
   #  LOGIN
    path('login/', views.loginn),
    path('loginp/', views.loginpost),
   #  ARTIST SIGNUP
    path('add_artist/', views.add_artist),
    path('add_artistp/', views.add_artistp),
   #  CHANGE PASSWORD ADMIN
    path('cpadmin/', views.changepass_admin),
    path('cpadminp/', views.changepass_adminp),
   #  ADMIN HOME
    path('admin_home/', views.admin_home),
   #  VIEW ARTIST
    path('view_artist/', views.view_artist),
   #  ARTIST HOME
    path('artist_home/', views.artist_home),
   # CHANGE PASSWORD ARTIST
    path('cpa/', views.changepass_artist),
    path('cpap/', views.changepass_artistp),
   # VIEW PROFILE ARTIST
    path('viewprof_artist/', views.viewprofile_artist),
   # EDIT ARTIST PROFILE
    path('editartp/<str:kk>', views.editprofile_artist),
    path('editartpp/', views.editprofile_artistp),
   # ADD CATEGORY
    path('add_cat/', views.add_category),
    path('add_catp/', views.add_categoryp),
   # VIEW CATEGORY
    path('view_category/', views.view_category),
   # DELETE ARTIST
    path('delete_artist/<str:kk>', views.delete_artist),
   # USER REGISTRATION
    path('user_reg/', views.user_reg),
    path('user_regp/', views.user_regp),
   # USER HOME
    path('user_home/', views.user_home),
   # VIEW USER
    path('view_user/', views.view_user),
    # DELETE USER
    path('delete_user/<str:kk>', views.delete_user),
    # VIEW PROFILE USER
    path('viewprofile_user/', views.viewprofile_user),
    # EDIT PROFILE USER
    path('editprofile_user/<str:kk>', views.editprofile_user),
    path('editprofile_userp/', views.editprofile_userp),
    # CHANGE PASSWORD USER
    path('cpu/', views.changepass_user),
    path('cpup/', views.changepass_userp),
    # LIVE CHAT
    path('home', views.home, name='home'),
    path('<str:room>/', views.room, name='room'),
    path('checkview', views.checkview, name='checkview'),
    path('send', views.send, name='send'),
    path('getMessages/<str:room>/', views.getMessages, name='getMessages'),
    # DELIVERY BOY SIGNUP
    path('add_deliveryboy', views.add_deliveryboy),
    path('add_deliveryboyp', views.add_deliveryboyp),
    # VIEW DELIVERY BOY(ADMIN)
    path('view_deliveryboy', views.view_deliveryboy),
    # DELETE DELIVERY BOY(ADMIN)
    path('delete_deliveryboy<str:kk>', views.delete_deliveryboy),
    # DELIVERY BOY HOME
    path('deliveryboy_home', views.deliveryboy_home),
    # VIEW PROFILE(DELIVERY BOY)
    path('vpd', views.viewprofile_deliveryboy),
    # EDIT PROFILE DELIVERY BOY
    path('edp/<str:kk>', views.editprofile_deliveryboy),
    path('edpd', views.editprofile_deliveryboyp),
    # CHANGE PASSWORD DELIVERY BOY
    path('cpd', views.changepass_deliveryboy),
    path('cpdp', views.changepass_deliveryboyp),
    # ADD PRODUCT
    path('addproduct', views.add_product),
    path('addproductp', views.add_productp),
    # VIEW PRODUCT
    path('vpr', views.view_product),
    # EDIT PRODUCT
    path('eddp/<str:kk>', views.edit_product),
    path('eddpp', views.editproductp),
    # DELETE PRODUCT
    path('dltp/<str:kk>', views.delete_product),
    # VIEW PRODUCT USER
    path('vpu', views.viewproduct_user),
    # PURCHASE
    path('purchase', views.purchase),
    path('purchasep', views.purchasep),
    # VIEW PURCHASE DELIVERY BOY
    path('viewpurchase', views.view_purchase),
    path('view_delivered', views.view_delivered),
    # VIEW PAYMENT
    path('view_payment', views.view_payment),
    # DELIVERY STATUS
    path('del_status', views.delivery_status),
    path('delivered<str:pk>', views.delivered),
    path('pending<str:pk>', views.Pending),
    # VIEW PURCHASE (USER)
    path('viewpu_user', views.viewpu_user),
    # VIEW DELIVERY STATUS(ARTIST)
    path('vds', views.viewdelivery_status),
    # VIEW DELIVERY STATUS(USER)
    path('vdsu', views.viewdeliverystatus_user),
    # SENT COMPLAINT
    path('sentcomp', views.sentcomp),
    path('sentcompp', views.sentcompp),
    # VIEW COMPLAINT(ADMIN)
    path('viewcomp', views.viewcomplaint),
    # VIEW COMPLAINT(USER)
    path('vcomp', views.viewcomp_user),
    # SENT REPLY
    path('sentreply/<str:pp>', views.sentreply),
    path('sentreplyp', views.sentreplyp),
    # VIEW REPLY
    path('viewrep', views.viewrep),
    # SENT FEEDBACK
    path('sfdb', views.sentfeedback),
    path('sfdbp', views.sentfeedbackp),
    # VIEW FEEDBACK(ADMIN)
    path('viewfdbk', views.viewfeedback),
    # SENT FEEDBACK REPLY(ADMIN)
    path('sfdbk/<str:pp>', views.sentfeedback_reply),
    path('sfdbkp', views.sentfeedback_replyp),
    # VIEW FEEDBACK RESPONSE(USER)
    path('vfdbkr', views.viewfdbkresponse),
    # RATING
    path('rating', views.rate_product),
    path('ratingp', views.rate_productp),
    # VIEW RATING(ARTIST)
    path('view_rating', views.view_rating),
    # VIEW RATING(USER)
    path('viewrating_user', views.viewrating_user),
    # DELETE CATEGORY
    path('dlt_cat/<str:kk>', views.dltcategory),










]
