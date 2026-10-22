public class SetMethodsExample {

    public static void demonstrateSetMethods() {

        // ------------------------------------------------
        // 1. add()
        // ------------------------------------------------

        Set<String> names = new Set<String>();

        Boolean addResult = names.add('Aman');

        System.debug('After add(): ' + names);
        System.debug('add() returned: ' + addResult);


        // ------------------------------------------------
        // 2. addAll(List)
        // ------------------------------------------------

        List<String> nameList = new List<String>{
            'Rahul',
            'Priya',
            'Aman'
        };

        Boolean addListResult = names.addAll(nameList);

        System.debug('After addAll(List): ' + names);
        System.debug('addAll(List) returned: ' + addListResult);


        // ------------------------------------------------
        // 3. addAll(Set)
        // ------------------------------------------------

        Set<String> moreNames = new Set<String>{
            'Rohan',
            'Neha'
        };

        Boolean addSetResult = names.addAll(moreNames);

        System.debug('After addAll(Set): ' + names);
        System.debug('addAll(Set) returned: ' + addSetResult);


        // ------------------------------------------------
        // 4. contains()
        // ------------------------------------------------

        Boolean containsResult = names.contains('Aman');

        System.debug('Does Set contain Aman? ' + containsResult);


        // ------------------------------------------------
        // 5. containsAll(List)
        // ------------------------------------------------

        List<String> checkList = new List<String>{
            'Aman',
            'Rahul'
        };

        Boolean containsListResult = names.containsAll(checkList);

        System.debug(
            'Does Set contain all elements of List? '
            + containsListResult
        );


        // ------------------------------------------------
        // 6. containsAll(Set)
        // ------------------------------------------------

        Set<String> checkSet = new Set<String>{
            'Aman',
            'Priya'
        };

        Boolean containsSetResult = names.containsAll(checkSet);

        System.debug(
            'Does Set contain all elements of Set? '
            + containsSetResult
        );


        // ------------------------------------------------
        // 7. clone()
        // ------------------------------------------------

        Set<String> clonedNames = names.clone();

        System.debug('Original Set: ' + names);
        System.debug('Cloned Set: ' + clonedNames);


        // ------------------------------------------------
        // 8. equals()
        // ------------------------------------------------

        Boolean equalsResult = names.equals(clonedNames);

        System.debug('Are both Sets equal? ' + equalsResult);


        // ------------------------------------------------
        // 9. hashCode()
        // ------------------------------------------------

        Integer hashValue = names.hashCode();

        System.debug('Hash Code of Set: ' + hashValue);


        // ------------------------------------------------
        // 10. size()
        // ------------------------------------------------

        Integer setSize = names.size();

        System.debug('Size of Set: ' + setSize);


        // ------------------------------------------------
        // 11. toString()
        // ------------------------------------------------

        String setString = names.toString();

        System.debug('Set as String: ' + setString);


        // ------------------------------------------------
        // 12. remove()
        // ------------------------------------------------

        Boolean removeResult = names.remove('Rohan');

        System.debug('After remove(): ' + names);
        System.debug('remove() returned: ' + removeResult);


        // ------------------------------------------------
        // 13. removeAll(List)
        // ------------------------------------------------

        List<String> removeList = new List<String>{
            'Rahul',
            'Priya'
        };

        Boolean removeListResult = names.removeAll(removeList);

        System.debug('After removeAll(List): ' + names);
        System.debug(
            'removeAll(List) returned: '
            + removeListResult
        );


        // ------------------------------------------------
        // 14. removeAll(Set)
        // ------------------------------------------------

        Set<String> removeSet = new Set<String>{
            'Neha'
        };

        Boolean removeSetResult = names.removeAll(removeSet);

        System.debug('After removeAll(Set): ' + names);
        System.debug(
            'removeAll(Set) returned: '
            + removeSetResult
        );


        // ------------------------------------------------
        // 15. retainAll(List)
        // ------------------------------------------------

        Set<String> employees = new Set<String>{
            'Aman',
            'Rahul',
            'Priya',
            'Rohan'
        };

        List<String> retainList = new List<String>{
            'Aman',
            'Priya'
        };

        Boolean retainListResult =
            employees.retainAll(retainList);

        System.debug(
            'After retainAll(List): '
            + employees
        );

        System.debug(
            'retainAll(List) returned: '
            + retainListResult
        );


        // ------------------------------------------------
        // 16. retainAll(Set)
        // ------------------------------------------------

        Set<String> retainSet = new Set<String>{
            'Priya',
            'Rohan'
        };

        Boolean retainSetResult =
            employees.retainAll(retainSet);

        System.debug(
            'After retainAll(Set): '
            + employees
        );

        System.debug(
            'retainAll(Set) returned: '
            + retainSetResult
        );


        // ------------------------------------------------
        // 17. isEmpty()
        // ------------------------------------------------

        Boolean emptyResult = employees.isEmpty();

        System.debug(
            'Is employees Set empty? '
            + emptyResult
        );


        // ------------------------------------------------
        // 18. clear()
        // ------------------------------------------------

        employees.clear();

        System.debug(
            'After clear(): '
            + employees
        );

        System.debug(
            'Is employees Set empty after clear()? '
            + employees.isEmpty()
        );
    }
}