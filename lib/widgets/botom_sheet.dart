import 'package:beta_home/helper/payment_helper.dart';
import 'package:beta_home/screens/payment_option.dart';
import 'package:beta_home/widgets/pay_instal_freq.dart';
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
}
