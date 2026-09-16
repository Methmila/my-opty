#!/bin/bash
# GitHub Project V2 - Link User Stories to Epics (Subtasks)
# Run locally after getting item IDs from the project
# Usage: chmod +x link_stories_to_epics.sh && ./link_stories_to_epics.sh

OWNER=Methmila
PROJECT=2

echo "=== STEP 1: Get Epic IDs ==="
echo "Run this first to get the epic item IDs:"
echo ""
echo "gh project item-list $PROJECT --owner $OWNER --format json | jq '.items[] | select(.type==\"DraftIssue\" and .title | startswith(\"Epic \")) | {title: .title, id: .id}'"
echo ""
echo "Copy the IDs and set them below:"
echo ""

# Set these after running the command above
EPIC_0_ID=""
EPIC_1_ID=""
EPIC_2_ID=""
EPIC_3_ID=""
EPIC_4_ID=""
EPIC_5_ID=""
EPIC_6_ID=""
EPIC_7_ID=""
EPIC_8_ID=""
EPIC_9_ID=""

# Verify all IDs are set
for i in {0..9}; do
    var="EPIC_${i}_ID"
    if [ -z "${!var}" ]; then
        echo "ERROR: $var is not set!"
        exit 1
    fi
done

echo "=== STEP 2: Link Stories to Epics ==="

link_story() {
    local epic_var="EPIC_${1}_ID"
    local epic_id="${!epic_var}"
    local story_title="$2"
    
    # Find story item ID
    story_id=$(gh project item-list $PROJECT --owner $OWNER --format json | \
        jq -r --arg title "$story_title" '.items[] | select(.type=="DraftIssue" and .title==$title) | .id')
    
    if [ -z "$story_id" ] || [ "$story_id" = "null" ]; then
        echo "WARNING: Story not found: $story_title"
        return 1
    fi
    
    # Link to parent epic
    gh project item-edit $PROJECT --owner $OWNER --id "$story_id" --field "Parent issue" --value "$epic_id"
    echo "Linked: $story_title -> Epic $1"
}

# Epic 0 - Project Setup & Configuration (15 stories)
link_story 0 "As a developer, I want to initialize a Git repository and branching strategy so that the team can collaborate without overwriting each other's work"
link_story 0 "As a developer, I want to set up the project folder structure (frontend, backend, database, docs) so that code stays organized from the start"
link_story 0 "As a developer, I want to configure the local development environment (runtime, package manager, \`.env\` file) so that every team member can run the project identically"
link_story 0 "As a developer, I want to install and configure the chosen frontend and backend frameworks so that development can begin on a working skeleton"
link_story 0 "As a developer, I want to set up the database server and create the initial schema (tables from the EER diagram) so that data can be stored from day one"
link_story 0 "As a developer, I want to seed the database with sample frame/lens/discount data so that the team can test features against realistic data"
link_story 0 "As a developer, I want to configure a local/staging web server so that the site can be previewed during development"
link_story 0 "As a developer, I want to register and configure a payment gateway sandbox account so that payment features can be built and tested safely"
link_story 0 "As a developer, I want to configure an email-sending service (SMTP/API key) so that Q&A notifications and dealer emails can be sent from the system"
link_story 0 "As a developer, I want to set up basic authentication and session handling (customer vs. client roles) so that access control works before other features are layered on"
link_story 0 "As a developer, I want to set up a shared coding standard, linter, and README so that all contributors follow consistent practices"
link_story 0 "As a project lead, I want to set up a task board (e.g., to-do wall/Trello/Jira) mapped to the four individual responsibilities so that progress can be tracked from the start"
link_story 0 "As a developer, I want to configure version control ignore rules and environment secrets handling so that sensitive credentials are never committed"
link_story 0 "As a developer, I want to set up a basic CI check (build/lint on push) so that broken code is caught early"
link_story 0 "As a developer, I want to document the deployment plan (hosting provider, domain) so that going live at the end of the project is straightforward"

# Epic 1 - Customer Shopping & Browsing (11 stories)
link_story 1 "As a customer, I want to view a list/grid of all frames so that I can browse available styles"
link_story 1 "As a customer, I want to filter frames by category (men, women, kids) so that I can narrow my search"
link_story 1 "As a customer, I want to filter frames by price range so that I can shop within my budget"
link_story 1 "As a customer, I want to filter frames by color or material so that I can find my preferred style"
link_story 1 "As a customer, I want to search frames by keyword or model name so that I can quickly find a specific item"
link_story 1 "As a customer, I want to open a frame's detail page (images, price, stock status) so that I can decide whether to purchase"
link_story 1 "As a customer, I want to view a list/grid of all lenses so that I can browse lens options"
link_story 1 "As a customer, I want to filter lenses by type (single vision, bifocal, progressive) so that I can find the right lens"
link_story 1 "As a customer, I want to open a lens's detail page (coating, price, description) so that I can make an informed choice"
link_story 1 "As a customer, I want to see a \"New Arrivals\" section so that I know about the latest frames/lenses"
link_story 1 "As a customer, I want to sort frames/lenses by price or popularity so that I can browse more efficiently"

# Epic 2 - Customer Registration & Support (10 stories)
link_story 2 "As a customer, I want to sign up with my name, email, phone, and password so that I can create an account"
link_story 2 "As a customer, I want to verify my email or phone (OTP/link) so that my account is secure"
link_story 2 "As a customer, I want to log in and log out so that I can access my account securely"
link_story 2 "As a customer, I want to reset my password so that I can regain access if I forget it"
link_story 2 "As a customer, I want to edit my profile details so that my information stays up to date"
link_story 2 "As a customer, I want to submit a question through the Q&A section so that I can ask about a product"
link_story 2 "As a customer, I want to view previously asked questions and answers (FAQ) so that I don't need to ask duplicates"
link_story 2 "As a client, I want to view a list of unanswered questions so that I can respond to them"
link_story 2 "As a client, I want to post an answer to a customer's question so that the customer is notified"
link_story 2 "As a customer, I want to receive a notification/email when my question is answered so that I stay informed"

# Epic 3 - Prescription & Progressive Lens Ordering (9 stories)
link_story 3 "As a customer, I want to fill in a prescription form (sphere, cylinder, axis, add power) so that my lens can be customized correctly"
link_story 3 "As a customer, I want to upload a scanned or photographed prescription document so that the shop can verify it"
link_story 3 "As a customer, I want to select \"progressive lens\" as an order type so that my order is routed to the correct workflow"
link_story 3 "As a customer, I want to link my prescription to a specific frame/lens order so that everything is processed together"
link_story 3 "As a client, I want to review a submitted prescription for completeness so that I can flag missing details"
link_story 3 "As a client, I want to approve or reject a progressive lens order so that only valid orders proceed to production"
link_story 3 "As a customer, I want to see an estimated receive date after order approval so that I know when to expect my order"
link_story 3 "As a client, I want to update the order status (processing, ready, dispatched) so that the customer stays informed"
link_story 3 "As a customer, I want to receive a notification when my order status changes so that I can plan pickup"

# Epic 4 - Payment & Billing (8 stories)
link_story 4 "As a customer, I want to view a list of accepted payment methods (card, bank transfer, cash on pickup) so that I can choose one"
link_story 4 "As a customer, I want to enter my payment details on a secure checkout page so that my transaction is protected"
link_story 4 "As a customer, I want to see a payment confirmation screen so that I know my payment succeeded"
link_story 4 "As a customer, I want to receive an emailed invoice/receipt so that I have proof of purchase"
link_story 4 "As a client, I want to view a list of all payments so that I can track incoming revenue"
link_story 4 "As a client, I want to filter payments by date range or status so that I can reconcile records"
link_story 4 "As a customer, I want to view my payment and order history in my account so that I can track past purchases"
link_story 4 "As a client, I want to issue a refund for a cancelled order so that the customer is reimbursed correctly"

# Epic 5 - Inventory & Stock Management (9 stories)
link_story 5 "As a client, I want to add a new frame record (model, color, material, price, stock quantity) so that it appears on the site"
link_story 5 "As a client, I want to edit an existing frame record so that its details stay accurate"
link_story 5 "As a client, I want to discontinue/delete a frame record so that it's removed from the shop wall"
link_story 5 "As a client, I want to add a new lens record so that it appears in the lens collection"
link_story 5 "As a client, I want to edit an existing lens record so that its details stay accurate"
link_story 5 "As a client, I want to organize frames and lenses into categories so that browsing is structured"
link_story 5 "As a client, I want to view a real-time availability report (in stock / low stock / out of stock) so that I can plan reorders"
link_story 5 "As a client, I want to receive a low-stock alert so that I can act before an item runs out"
link_story 5 "As a client, I want to export the availability report (PDF/Excel) so that I can share or archive it"

# Epic 6 - Discount Management (5 stories)
link_story 6 "As a client, I want to create a discount rule (percentage, target item, validity period) so that promotions can run"
link_story 6 "As a client, I want to edit or end a discount early so that I can adjust promotions as needed"
link_story 6 "As a client, I want to apply a discount to multiple items at once (bulk discount) so that I can run store-wide sales"
link_story 6 "As a customer, I want to see the discounted price clearly next to the original price so that I understand my savings"
link_story 6 "As a client, I want to view a log of past discounts so that I can review promotion history"

# Epic 7 - Client Task & Workflow Management (6 stories)
link_story 7 "As a client, I want to create a to-do task with a title, description, and due date so that I can track work items"
link_story 7 "As a client, I want to view all to-do tasks on a wall/board so that I can see my workload at a glance"
link_story 7 "As a client, I want to update a task's status (pending, in-progress, done) so that I can track progress"
link_story 7 "As a client, I want to prioritize tasks (high/medium/low) so that urgent work is visible first"
link_story 7 "As a client, I want to mark an order task as complete so that it's removed from the active queue"
link_story 7 "As a client, I want to receive a reminder for overdue tasks so that nothing is missed"

# Epic 8 - Dealer Communication & Ordering (5 stories)
link_story 8 "As a client, I want to maintain a list of dealer contacts (name, email, item type) so that I know who to contact"
link_story 8 "As a client, I want to manually compose an email to a dealer so that I can request specific stock"
link_story 8 "As a client, I want to review and approve an auto-generated email before it's sent so that I retain control over communications"
link_story 8 "As a dealer, I want to receive a clearly formatted order email so that I can fulfil the request accurately"
link_story 8 "As a client, I want to track sent dealer emails and their status (sent, replied, fulfilled) so that I can follow up"

# Epic 9 - Reporting & Analytics (2 stories)
link_story 9 "As a client, I want to view historical reports by month/year so that I can compare performance over time"
link_story 9 "As a client, I want to export reports (PDF/Excel) so that I can share them or keep records"

echo ""
echo "=== Done! All stories linked to epics ==="