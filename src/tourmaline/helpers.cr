module Tourmaline
  module Helpers
    extend self

    def actions_from_update(update : Update)
      actions = [] of UpdateAction

      actions << UpdateAction::Update

      if message = update.message
        actions << UpdateAction::Message

        if chat = message.chat
          actions << UpdateAction::PinnedMessage if chat.pinned_message
        end

        actions << UpdateAction::Text if message.text
        actions << UpdateAction::Audio if message.audio
        actions << UpdateAction::Document if message.document
        actions << UpdateAction::Photo if message.photo
        actions << UpdateAction::Sticker if message.sticker
        actions << UpdateAction::Video if message.video
        actions << UpdateAction::Voice if message.voice
        actions << UpdateAction::Contact if message.contact
        actions << UpdateAction::Location if message.location
        actions << UpdateAction::Venue if message.venue
        actions << UpdateAction::NewChatMembers if message.new_chat_members
        actions << UpdateAction::LeftChatMember if message.left_chat_member
        actions << UpdateAction::NewChatTitle if message.new_chat_title
        actions << UpdateAction::NewChatPhoto if message.new_chat_photo
        actions << UpdateAction::DeleteChatPhoto if message.delete_chat_photo
        actions << UpdateAction::GroupChatCreated if message.group_chat_created
        actions << UpdateAction::MigrateToChatId if message.migrate_from_chat_id
        actions << UpdateAction::SupergroupChatCreated if message.supergroup_chat_created
        actions << UpdateAction::ChannelChatCreated if message.channel_chat_created
        actions << UpdateAction::MigrateFromChatId if message.migrate_from_chat_id
        actions << UpdateAction::Game if message.game
        actions << UpdateAction::VideoNote if message.video_note
        actions << UpdateAction::Invoice if message.invoice
        actions << UpdateAction::SuccessfulPayment if message.successful_payment
        actions << UpdateAction::ConnectedWebsite if message.connected_website
        # actions << UpdateAction::PassportData if message.passport_data
      end

      actions << UpdateAction::EditedMessage if update.edited_message
      actions << UpdateAction::ChannelPost if update.channel_post
      actions << UpdateAction::EditedChannelPost if update.edited_channel_post
      actions << UpdateAction::InlineQuery if update.inline_query
      actions << UpdateAction::ChosenInlineResult if update.chosen_inline_result
      actions << UpdateAction::CallbackQuery if update.callback_query
      actions << UpdateAction::ShippingQuery if update.shipping_query
      actions << UpdateAction::PreCheckoutQuery if update.pre_checkout_query
      actions << UpdateAction::Poll if update.poll
      actions << UpdateAction::PollAnswer if update.poll_answer

      actions
    end
  end
end
