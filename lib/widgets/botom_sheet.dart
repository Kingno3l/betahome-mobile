import 'package:beta_home/helper/payment_helper.dart';
import 'package:beta_home/models/listing_item.dart';
import 'package:beta_home/models/order_item.dart';
import 'package:beta_home/screens/payment_option.dart';
import 'package:beta_home/widgets/ordered_item.dart';
import 'package:beta_home/widgets/pay_instal_freq.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BotomShet {
  static Padding topupAmount(BuildContext context, Function(String) onNext) {
    String amount = '';
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'How much do you want to top up?',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            cursorColor: Colors.black,
            keyboardType: const TextInputType.numberWithOptions(),
            onChanged: (val) => amount = val,
            decoration: const InputDecoration(
              hintText: 'Amount',
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              filled: true,
              fillColor: Color(0xffFFF6D6),
            ),
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xff000000),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          TextButton(
            onPressed: () => onNext(amount),
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                backgroundColor: const Color(0xFFFFDA58)),
            child:
                const Text('Next', style: TextStyle(color: Color(0xFF000000))),
          ),
        ],
      ),
    );
  }

  static Column productCategories(List items, Function(dynamic) onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Select category'),
        ),
        Divider(
          color: Colors.grey.shade300,
        ),
        ...items.map(
          (item) => InkWell(
            onTap: () => onSelect(item),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                item['name'],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Padding listingTypes(Function(String, String) onSelect) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 14),
            child: Text('Choose listing type'),
          ),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              SizedBox(
                width: 160,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    onTap: () =>
                        onSelect('63569bbfc3acaa4ec269aaf5', 'Item for sale'),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xffffc9d9),
                            ),
                            child: const Icon(Icons.production_quantity_limits),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              'Item for sale',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Text(
                            'Create a single listing for one or more items to sell.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    onTap: () => onSelect(
                        '63569c09c3acaa4ec269aaf6', 'Vehicle for sale'),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xffb5ede5),
                            ),
                            child: const Icon(Icons.production_quantity_limits),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              'Vehicle for sale',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Text(
                            'Sell a car, van or other type of vehicle.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    onTap: () => onSelect('63569c36c3acaa4ec269aaf7',
                        'Property for sale or rent'),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xfffeebd8),
                            ),
                            child: const Icon(Icons.production_quantity_limits),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              'Property for sale or rent',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Text(
                            'List a house or flat for sale or rent.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  static Padding requestProvider(
      BuildContext context, dynamic provider, Function(dynamic) onYes) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Are you sure you want to request ${provider['first_name']} ${provider['last_name']}?',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 26,
          ),
          TextButton(
            onPressed: () => onYes(provider),
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                backgroundColor: const Color(0xFFFFDA58)),
            child:
                const Text('Yes', style: TextStyle(color: Color(0xFF000000))),
          ),
        ],
      ),
    );
  }

  static Column installmentOptions(List installments, Map selected,
      Function(Map<String, dynamic>) onSelected) {
    // int selectedIndex = -1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Select your prefered payment plan'),
        ),
        ...installments.asMap().entries.map(
              (entry) => Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 15,
                  right: 12,
                  bottom: 15,
                ),
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                    color: Color(entry.value['tag'] == selected['tag']
                        ? 0xff73D282
                        : 0xffFFF6D6),
                    borderRadius: BorderRadius.circular(6)),
                child: InkWell(
                  onTap: () => onSelected(entry.value),
                  child: Row(
                    children: [
                      RadioButton(
                          selected: entry.value['tag'] == selected['tag']),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          '${entry.value['tag']} payment plan',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(
                              entry.value['tag'] == selected['tag']
                                  ? 0xffffffff
                                  : 0xff000000,
                            ),
                          ),
                        ),
                      ),
                      PayInstalFreq(
                          entry.value, entry.value['tag'] == selected['tag']),
                    ],
                  ),
                ),
              ),
            ),
      ],
    );
  }

  static Widget orderDetails(BuildContext context, OrderItem? item) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 30,
        right: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      child: item != null
          ? Column(
              children: [
                Row(
                  children: [
                    Text(
                      '${item.type} Order'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const Text(' | '),
                    Text(
                      item.id,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.date,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Color(0xff696969),
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'N${item.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: item.isPaid
                            ? Colors.green.shade100
                            : Colors.red.shade100,
                      ),
                      child: Text(
                        item.isPaid ? 'Paid' : 'Unpaid',
                        style: TextStyle(
                          color: item.isPaid
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                ...item.items
                    .map((e) => OrderedItem(ListingItem.fromJson(e), null,
                        hidePMBts: true))
                    .toList(),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  static Padding verifyBetaHelp(BuildContext context, List banks, List services,
      Map state, Function(Map<String, dynamic>) setState, Function() onNext) {
    // final acctNoController = TextEditingController();
    String acctNo = '';

    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Just a few steps to go',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          const Divider(),
          const SizedBox(
            height: 7,
          ),
          // Step 1
          if (state['step'] == 1)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'SERVICE',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Select your service category',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...services.map(
                  (item) => InkWell(
                    onTap: () => setState({'serviceID': item['_id']}),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 0),
                      child: Text(
                        item['name'],
                        style: TextStyle(
                            color: state['serviceID'] == item['_id']
                                ? const Color(0xFFFFDA58)
                                : Colors.black87,
                            fontWeight: state['serviceID'] == item['_id']
                                ? FontWeight.w600
                                : FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      if (state['step'] != 2) {
                        setState({'step': 2});
                      }
                    },
                    // style: TextButton.styleFrom(
                    //   padding: const EdgeInsets.symmetric(vertical: 15.0),
                    //   backgroundColor: const Color(0xFFFFDA58),
                    // ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Color(0xFFFFDA58),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          // step 2
          if (state['step'] == 2)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'BANK ACCOUNT',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Kindly provide your account number. We need this to settle your payment when necessary.',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Ensure this account belongs to you.',
                  style: TextStyle(fontSize: 12, color: Colors.red.shade300),
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Text(
                      'Select Bank',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: banks
                        .map((item) => DropdownMenuItem<Map<String, dynamic>>(
                              value: item,
                              child: Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: state['bank'],
                    onChanged: (val) {
                      setState({'bank': val});
                    },
                    buttonHeight: 48,
                    // buttonWidth: 200,
                    itemHeight: 40,
                    // dropdownMaxHeight: 200,
                    // searchController: textEditingController,
                    // searchInnerWidget: Padding(
                    //   padding: const EdgeInsets.only(
                    //     top: 8,
                    //     bottom: 4,
                    //     right: 8,
                    //     left: 8,
                    //   ),
                    //   child: TextFormField(
                    //     // controller: textEditingController,
                    //     decoration: InputDecoration(
                    //       isDense: true,
                    //       contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10,
                    //         vertical: 8,
                    //       ),
                    //       hintText: 'Search for an item...',
                    //       hintStyle: const TextStyle(fontSize: 12),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // searchMatchFn: (item, searchValue) {
                    //   return (item.value.toString().contains(searchValue));
                    // },
                    //This to clear the search value when you close the menu
                    // onMenuStateChange: (isOpen) {
                    //   if (!isOpen) {
                    //     textEditingController.clear();
                    //   }
                    // },
                    buttonDecoration: const BoxDecoration(
                      color: Color(0xffFFF6D6),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  enabled: state['bank'] != null,
                  cursorColor: Colors.black,
                  keyboardType: const TextInputType.numberWithOptions(),
                  onChanged: (val) {
                    if (val.length == 10) {
                      acctNo = val;
                      setState({'isVerifying': true});
                    }
                  },
                  // controller: acctNoController,
                  decoration: const InputDecoration(
                    hintText: 'Account Number',
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    filled: true,
                    fillColor: Color(0xffFFF6D6),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Text(
                  state['isVerifying'] == true
                      ? 'Verifying...'
                      : (state['account'] != null
                          ? state['account']['account_name']
                          : ''),
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                // const SizedBox(
                //   height: 18,
                // ),
                // TextField(
                //   cursorColor: Colors.black,
                //   keyboardType: const TextInputType.numberWithOptions(),
                //   // onChanged: (val) => vMethodVal = val,
                //   decoration: InputDecoration(
                //     hintText: 'Enter ${state['vMethod']}',
                //     contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                //     border: const OutlineInputBorder(
                //       borderSide: BorderSide.none,
                //       borderRadius: BorderRadius.all(Radius.circular(0)),
                //     ),
                //     filled: true,
                //     fillColor: const Color(0xffFFF6D6),
                //   ),
                //   style: const TextStyle(
                //     fontSize: 15,
                //     color: Color(0xff000000),
                //   ),
                // ),
                const SizedBox(
                  height: 18,
                ),
                // if (state['vMethod'] == 'BVN')
                //   InkWell(
                //     onTap: () {
                //       setState({'vMethod': 'NIN'});
                //     },
                //     child: const Text(
                //       'Use NIN instead',
                //       // textAlign: TextAlign.right,
                //       style: TextStyle(
                //         fontSize: 12,
                //       ),
                //     ),
                //   ),
                // if (state['vMethod'] == 'NIN')
                //   InkWell(
                //     onTap: () {
                //       setState({'vMethod': 'BVN'});
                //     },
                //     child: const Text(
                //       'Use BVN instead',
                //       // textAlign: TextAlign.right,
                //       style: TextStyle(
                //         fontSize: 12,
                //       ),
                //     ),
                //   ),
                // const SizedBox(
                //   height: 26,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (state['step'] != 1) {
                          setState({'step': 1});
                        }
                      },
                      // style: TextButton.styleFrom(
                      //   padding: const EdgeInsets.symmetric(vertical: 15.0),
                      //   backgroundColor: const Color(0xFFFFDA58),
                      // ),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          state['account'] != null ? onNext() : null,
                      // style: TextButton.styleFrom(
                      //   padding: const EdgeInsets.symmetric(vertical: 15.0),
                      //   backgroundColor: const Color(0xFFFFDA58),
                      // ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Color(0xFFFFDA58),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
