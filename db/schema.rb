# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150501180311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "breeze_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ancestry"
    t.string   "index"
    t.integer  "ancestry_depth", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "breezes", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "url"
    t.string   "image"
    t.integer  "breeze_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forem_categories", force: true do |t|
    t.string   "name",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "position",   default: 0
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true, using: :btree

  create_table "forem_forums", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", default: 0
    t.string  "slug"
    t.integer "position",    default: 0
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true, using: :btree

  create_table "forem_groups", force: true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name", using: :btree

  create_table "forem_memberships", force: true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id", using: :btree

  create_table "forem_moderator_groups", force: true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id", using: :btree

  create_table "forem_posts", force: true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
    t.string   "state",       default: "pending_review"
    t.boolean  "notified",    default: false
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id", using: :btree
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state", using: :btree
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id", using: :btree
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id", using: :btree

  create_table "forem_subscriptions", force: true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",       default: false,            null: false
    t.boolean  "pinned",       default: false
    t.boolean  "hidden",       default: false
    t.datetime "last_post_at"
    t.string   "state",        default: "pending_review"
    t.integer  "views_count",  default: 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id", using: :btree
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true, using: :btree
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state", using: :btree
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id", using: :btree

  create_table "forem_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             default: 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at", using: :btree
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id", using: :btree
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_viewable_id", using: :btree

  create_table "gallery_images", force: true do |t|
    t.integer  "resort_id"
    t.string   "image"
    t.text     "description"
    t.integer  "gallerable_id"
    t.string   "gallerable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "url"
    t.integer  "order"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "image_galleries", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "image_gallerable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_gallerable_type"
  end

  add_index "image_galleries", ["image_gallerable_id", "image_gallerable_type"], name: "index_image_gallerable_polymorphic", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: true do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "media_image_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ancestry"
    t.string   "index"
    t.integer  "ancestry_depth", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "offer_country_assignments", force: true do |t|
    t.integer "offer_id"
    t.integer "resort_category_id"
  end

  add_index "offer_country_assignments", ["offer_id"], name: "index_offer_country_assignments_on_offer_id", using: :btree
  add_index "offer_country_assignments", ["resort_category_id"], name: "index_offer_country_assignments_on_resort_category_id", using: :btree

  create_table "offer_resort_assignments", force: true do |t|
    t.integer "offer_id"
    t.integer "resort_id"
  end

  add_index "offer_resort_assignments", ["offer_id"], name: "index_offer_resort_assignments_on_offer_id", using: :btree
  add_index "offer_resort_assignments", ["resort_id"], name: "index_offer_resort_assignments_on_resort_id", using: :btree

  create_table "offer_user_assignments", force: true do |t|
    t.integer "offer_id"
    t.integer "user_id"
  end

  add_index "offer_user_assignments", ["offer_id"], name: "index_offer_user_assignments_on_offer_id", using: :btree
  add_index "offer_user_assignments", ["user_id"], name: "index_offer_user_assignments_on_user_id", using: :btree

  create_table "offer_user_participant_assignments", force: true do |t|
    t.integer "offer_id"
    t.integer "user_id"
  end

  add_index "offer_user_participant_assignments", ["offer_id"], name: "index_offer_user_participant_assignments_on_offer_id", using: :btree
  add_index "offer_user_participant_assignments", ["user_id"], name: "index_offer_user_participant_assignments_on_user_id", using: :btree

  create_table "offers", force: true do |t|
    t.integer  "tour_style_id"
    t.integer  "accommodation_id"
    t.string   "title"
    t.text     "description"
    t.string   "whats_included"
    t.integer  "duration"
    t.integer  "check_in_d"
    t.integer  "check_in_m"
    t.integer  "check_in_y"
    t.integer  "switch_off_d"
    t.integer  "switch_off_m"
    t.integer  "switch_off_y"
    t.date     "check_in"
    t.date     "switch_off"
    t.string   "image"
    t.decimal  "price",            precision: 5, scale: 0
    t.boolean  "published",                                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["accommodation_id"], name: "index_offers_on_accommodation_id", using: :btree
  add_index "offers", ["tour_style_id"], name: "index_offers_on_tour_style_id", using: :btree

  create_table "resort_categories", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "ancestry"
    t.string  "index"
    t.integer "ancestry_depth", default: 0
    t.string  "image"
  end

  create_table "resorts", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "web"
    t.string   "fb"
    t.integer  "resort_category_id"
    t.integer  "index"
    t.text     "level1_description"
    t.text     "level2_description"
    t.text     "level3_description"
    t.string   "airport"
    t.integer  "altitude_top"
    t.integer  "altitude_bottom"
    t.integer  "drop"
    t.integer  "terrain"
    t.integer  "lifts"
    t.string   "slopes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "map_url"
  end

  create_table "role_assignments", force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "roles", force: true do |t|
    t.string "name"
  end

  create_table "tip_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ancestry"
    t.string   "index"
    t.integer  "ancestry_depth", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "tips", force: true do |t|
    t.string   "title"
    t.text     "level1_description"
    t.integer  "tip_category_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_description"
    t.text     "level2_description"
    t.text     "level3_description"
  end

  create_table "tour_country_assignments", force: true do |t|
    t.integer "tour_id"
    t.integer "resort_category_id"
  end

  add_index "tour_country_assignments", ["resort_category_id"], name: "index_tour_country_assignments_on_resort_category_id", using: :btree
  add_index "tour_country_assignments", ["tour_id"], name: "index_tour_country_assignments_on_tour_id", using: :btree

  create_table "tour_resort_assignments", force: true do |t|
    t.integer "tour_id"
    t.integer "resort_id"
  end

  add_index "tour_resort_assignments", ["resort_id"], name: "index_tour_resort_assignments_on_resort_id", using: :btree
  add_index "tour_resort_assignments", ["tour_id"], name: "index_tour_resort_assignments_on_tour_id", using: :btree

  create_table "tour_styles", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_user_assignments", force: true do |t|
    t.integer "tour_id"
    t.integer "user_id"
  end

  add_index "tour_user_assignments", ["tour_id"], name: "index_tour_user_assignments_on_tour_id", using: :btree
  add_index "tour_user_assignments", ["user_id"], name: "index_tour_user_assignments_on_user_id", using: :btree

  create_table "tour_user_participant_assignments", force: true do |t|
    t.integer "tour_id"
    t.integer "user_id"
    t.integer "status",  default: 0
  end

  add_index "tour_user_participant_assignments", ["tour_id"], name: "index_tour_user_participant_assignments_on_tour_id", using: :btree
  add_index "tour_user_participant_assignments", ["user_id"], name: "index_tour_user_participant_assignments_on_user_id", using: :btree

  create_table "tours", force: true do |t|
    t.integer  "tour_style_id"
    t.integer  "accommodation_id"
    t.string   "title"
    t.text     "description"
    t.string   "whats_included"
    t.integer  "duration"
    t.string   "image"
    t.decimal  "price",            precision: 5, scale: 0
    t.boolean  "published",                                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "check_in_d"
    t.integer  "check_in_m"
    t.integer  "check_in_y"
    t.integer  "switch_off_d"
    t.integer  "switch_off_m"
    t.integer  "switch_off_y"
    t.date     "check_in"
    t.date     "switch_off"
  end

  add_index "tours", ["accommodation_id"], name: "index_tours_on_accommodation_id", using: :btree
  add_index "tours", ["tour_style_id"], name: "index_tours_on_tour_style_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",               null: false
    t.string   "encrypted_password",     default: "",               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "forem_state",            default: "pending_review"
    t.boolean  "forem_auto_subscribe",   default: false
    t.datetime "last_seen_at"
    t.string   "avatar"
    t.string   "surname"
    t.string   "login"
    t.string   "sex"
    t.date     "birthday"
    t.string   "country"
    t.string   "city"
    t.string   "web"
    t.string   "fb"
    t.text     "bio"
    t.string   "fb_avatar"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "video_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ancestry"
    t.string   "index"
    t.integer  "ancestry_depth", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "source_cd"
    t.integer  "video_category_id"
    t.string   "source_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", name: "mb_opt_outs_on_conversations_id", column: "conversation_id"

  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", name: "notifications_on_conversation_id", column: "conversation_id"

  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", name: "receipts_on_notification_id", column: "notification_id"

end
