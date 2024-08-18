class ApiUrls {
  static const baseUrl = "https://regroup.betadelivery.com/api/v1/";

  static const getlogin = "${baseUrl}login";
  static const forgotpassword = "${baseUrl}forgot-password";
  static const verifyotp = "${baseUrl}forgot-password/verify-otp";
  static const tellUsBusinessApi = "${baseUrl}tell-us-about-your-business";
  static const letUsUnderstandApi = "${baseUrl}update-business-profile-step-1";
  static const resetpassword = "${baseUrl}reset-password";

  static const registeration = "${baseUrl}send_otp";

  static const verifyregisteration = "${baseUrl}verify_otp";

  static const tellusIndividual = "${baseUrl}add_profile";

  static const getIndividualactivity = "${baseUrl}fetch-interests";

  static const postindividualactivity = "${baseUrl}select-interests";

  static const getgroups = "${baseUrl}fetch-groups";

  static const postgroups = "${baseUrl}select-groups";

  static const getcommunities = "${baseUrl}fetch-communities";

  static const postcommunities = "${baseUrl}select-communities";

  static const googlelogin = "${baseUrl}sign-in-with-google-login";
  static const applelogin = "${baseUrl}apple-login-or-registration";
  static const facebooklogin = "${baseUrl}facebook-login";

  static const storeDetailsOfOAuth = "${baseUrl}update-user-account-type";

  static const getuserdetails = "${baseUrl}get-auth-user-data";

  static const getfaqs = "${baseUrl}fetch-faqs";

  static const getprivacypolicy = "${baseUrl}fetch-privacy-policy";

  static const gettermsconditios = "${baseUrl}fetch-terms-and-condition";

  static const postcontactus = "${baseUrl}contact-us";

  static const postreportbug = "${baseUrl}bug-report";

  static const getfollowers = "${baseUrl}fetch-followers";

  static const getfollowing = "${baseUrl}fetch-following";

  static const postblock = "${baseUrl}block-profile";

  static const postunfollow = "${baseUrl}follow-user";

  static const postremoveuser = "${baseUrl}remove-follower";

  static const postchangepassword = "${baseUrl}update-password-send-otp";

  static const postchangepassverify = "${baseUrl}verify-update-password-otp";

  static const gettimelineabilitylist = "${baseUrl}list-of-abilities";

  static const posttimeline = "${baseUrl}create-timeline";

  static const postaccountvisibility = "${baseUrl}account-visibility";

  static const postdeleteaccount = "${baseUrl}delete-my-account";

  static const postlogoutaccount = "${baseUrl}logout";

  static const getedittimeline = "${baseUrl}get-timeline-data";

  static const postedittimeline = "${baseUrl}update-timeline";

  static const postremovetimeline = "${baseUrl}delete-timeline";

  static const postremovecertification = "${baseUrl}delete-certification";

  static const postcertification = "${baseUrl}store-certification";

  static const getaccountsessions = "${baseUrl}get-account-session";

  static const postuserdevice = "${baseUrl}store-account-session";

  static const getmyjoinedgroups = "${baseUrl}my-joined-groups";

  static const getmycommunity = "${baseUrl}fetch-my-communities";

  static const getcommunitydetail = "${baseUrl}fetch-community-all-details";

  static const getComPostdetail = "${baseUrl}fetch-community-all-posts";



  static const getrequestedcommunity =
      "${baseUrl}fetch-joining-request-for-community";

  static const getInvitecommunity = "${baseUrl}fetch-all-invite";

  static const postcancelrequest = "${baseUrl}cancel-request-of-community";

  static const postacceptinvite = "${baseUrl}accept-invite-to-join-community";

  static const postrejectinvite = "${baseUrl}reject-invite-to-join-community";


  static const getusercertificates = "${baseUrl}my-certificates";

  static const postnotification = "${baseUrl}update-notification-settings";
  static const getnotification = "${baseUrl}fetch-notification-settings";

  static const getblockuser = "${baseUrl}fetch-blocked-profile";
  static const postblockuser = "${baseUrl}block-profile";
  static const getlatestpost = "${baseUrl}fetch-latest-post";
  static const getpopularpost = "${baseUrl}fetch-popular-post";

  static const getfeedpost = "${baseUrl}fetch-post";
  static const tagcommunityuser = "${baseUrl}fetch-communities-tags-to-pin";

// Individual
  static const posteditprofile = "${baseUrl}update-profile";
  static const geteditprofile = "${baseUrl}fetch-profile";
  static const getinterestlist = "${baseUrl}fetch-interests";

// Business
  static const posteditprofilebusiness = "${baseUrl}update-business-profile";
  static const geteditprofilebusiness = "${baseUrl}fetch-business-profile";

//Guest

  static const getGuestProfileInd =
      "${baseUrl}get-guest-view-of-individual-user-profile";
  static const getGuestProfileBus =
      "${baseUrl}get-guest-view-of-business-user-profile";

  static const getGuestfollowers = "${baseUrl}get-guest-user-followers";
  static const getGuestfollowing = "${baseUrl}get-guest-user-following";

  //community
  static const getpostcommunitylist = "${baseUrl}fetch-communities-with-tags";
  static const getpopulartagscommunity = "${baseUrl}fetch-popular-tags";

  static const postnewtags = "${baseUrl}store-tags";
  static const postupload = "${baseUrl}store-post";
  static const postlike = "${baseUrl}fetch-like-list";

  static const getuserpinlist = "${baseUrl}fetch-pinned-detail";

  static const postusertag = "${baseUrl}pin-unpin";

  //comments
  static const getComments = "${baseUrl}fetch-comment-with-replied-comment";
  static const storeComments = "${baseUrl}store-comment";
  static const storeRepliesOnComments = "${baseUrl}reply-on-comment";
  static const deleteComments = "${baseUrl}delete-comment";
  static const deleteRepliesComments = "${baseUrl}delete-reply-on-comment";

  static const getLikeicons = "${baseUrl}fetch-like-icons";

  static const postLike = "${baseUrl}like-post";

  static const getTagsdetails = "${baseUrl}fetch-post-by-tag";

  static const postusersave = "${baseUrl}save-post";
  static const getpostdetail = "${baseUrl}fetch-single-post";

  static const getpopularTagsdetails = "${baseUrl}fetch-popular-post";
  
  static const postcreatecommunity = "${baseUrl}create-community";
  
  static const getcommunityaddgroups = "${baseUrl}fetch-groups-to-add";

  static const getcommunitygroups = "${baseUrl}fetch-community-all-groups";

  static const getcommunitymembers = "${baseUrl}fetch-community-all-members";

  static const geteditcommunity = "${baseUrl}edit-community";




}
