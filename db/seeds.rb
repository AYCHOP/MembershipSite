Coupon.delete_all

Coupon.create \
      name: "99designs",
      teaser_name: "99designs",
      teaser_description: "$79 FREE featured job upgrade",
      company_name: "99designs",
      company_url: "http://99designs.com.au",
      company_about: "Get a design you'll love — guaranteed. Let our community of 296,615 designers create dozens of designs for you.",
      logo_filename: "99-Designs-Logo.jpg",
      description: "Get a $79 upgrade to a featured job on 99Designs. A Featured Contest Upgrade puts your design contest first! As the name suggests, they feature it to their best designers before regular listings. This is on average results in 130% more designers! ",
      how_to_redeem: "not shown"

Coupon.create \
      name: "bugherd",
      teaser_name: "Bugherd",
      teaser_description: "$xx monthly discount for 12 months",
      company_name: "Bugherd",
      company_url: "https://www.bugherd.com",
      company_about: "The world's simplest bug tracker. Get detailed bug reports on any web project with a simple point and click.",
      logo_filename: "Bugherd-Logo.jpg",
      description: "Startup Victoria members receive $xx off subscription fees for the first 12 months on any plan level. Plans start from $29 per month*. *Discount available via coupon redemption on payment. The coupon only gives you a discount, accounts will not go into credit.",
      how_to_redeem: "not shown"

Coupon.create \
      name: "geckoboard",
      teaser_name: "Geckoboard",
      teaser_description: "xx% discount for 12 months",
      company_name: "Geckoboard",
      company_url: "https://www.geckoboard.com",
      company_about: "Geckoboard is a data communication tool that connects to all your data sources and displays your most important metric    s on a beautifully designed and intuitive dashboard.",
      logo_filename: "Geckoboard-Logo.jpg",
      description: "Get xx% off for the first 12 months of your Geckoboard subscription.  Startup plans start from $53 a month.",
      how_to_redeem: "not shown"

Coupon.create \
      name: "learnable",
      teaser_name: "Learnable",
      teaser_description: "xx months FREE",
      company_name: "Learnable",
      company_url: "https://learnable.com",
      company_about: "Learn Web Development and Design from the Experts with over 4400 videos.",
      logo_filename: "Learnable-Logo.jpg",
      description: "Get a xx months Learnable membership with access to all books and courses FREE!",
      how_to_redeem: "not shown"

Event.delete_all
EventVenue.delete_all
EventOrganizer.delete_all

EventVenue.create! \
      code: "inspire9",
      name: "Inspire9",
      address: "Level 1, 41-43 Stewart st, Richmond, VIC 3121",
      url: "http://inspire9.com"

EventOrganizer.create! \
      code: "startup-victoria",
      name: "Startup Victoria",
      url: "https://startupvictoria.com.au"

Event.create! \
      title: "The ups-and-downs of the entrepreneurial journey",
      short_description: "a panel of fantastic speakers who will use their experience to teach you a thing or two about staying sane while running your startup",
      event_venue: EventVenue.find_by_code("inspire9"),
      event_organizer: EventOrganizer.find_by_code("startup-victoria"),
      url: "http://www.meetup.com/Lean-Startup-Melbourne/events/182531822/",
      starts_at: 1.month.from_now

Event.create! \
      title: "The best event since sliced bread was invented",
      short_description: "a panel of fantastic bread experts will take you on a journey never to be repeated",
      event_venue: EventVenue.find_by_code("inspire9"),
      event_organizer: EventOrganizer.find_by_code("startup-victoria"),
      url: "http://example.com",
      starts_at: 2.month.from_now

PasswordResetToken.delete_all
Membership.delete_all
Customer.delete_all
User.delete_all

u1 = User.create! \
  email: 'alice@example.com',
  password: '111',
  full_name: "Alice Bloggs",
  admin: false

u2 = User.create! \
  email: 'bob@example.com',
  password: '222',
  full_name: "Bob Bloggs",
  phone_number: "123 456 789",
  admin: true

c1 = Customer.create! \
  user_id: u1.id,
  stripe_id: 111,
  stripe_card_id: 111

c2 = Customer.create! \
  user_id: u2.id,
  stripe_id: 111,
  stripe_card_id: 111

Membership.create! \
  customer_id: c1.id,
  plan_id: MembershipPlan.premium.id

Membership.create! \
  customer_id: c2.id,
  plan_id: MembershipPlan.premium.id
